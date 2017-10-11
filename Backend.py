from flask import Flask
from flask_restful import Resource, Api
from flask_restful import reqparse
from flask.ext.mysql import MySQL

app = Flask(__name__)

mysql = MySQL()

# MySQL configuration
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'fitnowdb'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)
api = Api(app)


class CreateUser(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('name', type=str, help='Name to create user')
            parser.add_argument('fat_last_name', type=str, help='Fat_Last_Name to create user')
            parser.add_argument('mot_last_name', type=str, help='Mot_Last_Name to create user')
            parser.add_argument('sex', type=str, help='Sex to create user')
            parser.add_argument('dni', type=str, help='Dni to create user')
            parser.add_argument('born', type=str, help='Born to create user')
            parser.add_argument('phone', type=str, help='Phone to create user')
            parser.add_argument('email', type=str, help='Email to create user')
            parser.add_argument('username', type=str, help='Username address to create user')
            parser.add_argument('password', type=str, help='Password to create user')
            parser.add_argument('direction', type=str, help='Direction to create user')

            args = parser.parse_args()

            _userName = args['name']
            _userFatLastName = args['fat_last_name']
            _userMotLastName = args['mot_last_name']
            _userSex = args['sex']
            _userDni = args['dni']
            _userBorn = args['born']
            _userPhone = args['phone']
            _userEmail = args['email']
            _userUsername = args['username']
            _userPassword = args['password']
            _userDirection = args['direction']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_CreateUser', (_userName, _userFatLastName, _userMotLastName, _userSex, _userDni,
                                              _userBorn, _userPhone, _userEmail, _userUsername, _userPassword,
                                              _userDirection))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return {'StatusCode': '200', 'Message': 'User creation success'}
            else:
                return {'StatusCode': '1000', 'Message': str(data[0])}

        except Exception as e:
            return {'error': str(e)}


class AddEvent(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('name', type=str)
            parser.add_argument('date', type=str)
            parser.add_argument('creator', type=str)
            parser.add_argument('personal', type=str)
            parser.add_argument('event_type_id', type=str)
            parser.add_argument('place_id', type=str)
            args = parser.parse_args()

            _eventName = args['name']
            _eventDate = args['date']
            _eventCreator = args['creator']
            _eventPersonal = args['personal']
            _eventIdType_Event = args['event_type_id']
            _eventIdPlace = args["place_id"]

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_AddEvent', (_eventName, _eventDate, _eventCreator, _eventPersonal,
                                             _eventIdType_Event, _eventIdPlace))
            data = cursor.fetchall()

            conn.commit()
            return {'StatusCode': '200', 'Message': 'Success'}

        except Exception as e:
            return {'error': str(e)}


class GetAllEvents(Resource):
    def get(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('name', type=str)
            args = parser.parse_args()

            _eventName = args['name']


            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_GetAllEvents', (_eventName,))
            data = cursor.fetchall()

            events_list = []
            for event in data:
                i = {
                    'IdEvent': event[0],
                    'Name': event[1],
                    'Creator': event[2],
                    'Personal': event[3],
                    'IdType_Event': event[4],
                    'IdPlace': event[5]
                }
                events_list.append(i)
            return {'StatusCode': '200', 'Events': events_list}

        except Exception as e:
            return {'error': str(e)}


class AuthenticateUser(Resource):
    def post(self):
        try:
            parser = reqparse.RequestParser()
            parser.add_argument('user_name', type=str, help='User Name for Authentication')
            parser.add_argument('password', type=str, help='Password for Authentication')
            args = parser.parse_args()

            _userName = args['user_name']
            _userPassword = args['password']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_AuthenticateUser', (_userName, _userPassword,))
            data = cursor.fetchall()


            if len(data)>0:

                    return {'status': 200, 'UserId':str(data[0][0])}
            else:

                    return {'status': 100,'message':'Authentication failure'}

        except Exception as e:
            return {'error': str(e)}

api.add_resource(CreateUser, '/CreateUser')
api.add_resource(AddEvent, '/AddEvent')
api.add_resource(GetAllEvents, '/GettAllEvents')
api.add_resource(AuthenticateUser, '/AuthenticateUser')

if __name__ == '__main__':
    app.run(debug=True)
