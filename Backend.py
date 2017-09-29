from flask import Flask
from flask_restful import Resource, Api
from flask_restful import reqparse
from flask.ext.mysql import MySQL

app = Flask(__name__)

mysql = MySQL()

# MySQL configuration
app.config['MYSQL_DATABASE_USER'] = 'heroku_ad48c7c4d037cf0'
app.config['MYSQL_DATABASE_PASSWORD'] = 'f3db00f8'
app.config['MYSQL_DATABASE_DB'] = 'heroku_ad48c7c4d037cf0'
app.config['MYSQL_DATABASE_HOST'] = 'us-cdbr-iron-east-05.cleardb.net'

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
            _event_id_Type_Event = args['event_type_id']
            _event_id_Place = args['place_id']

            #print _userId;

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_AddEvents', (_eventName, _eventDate, _eventCreator, _eventPersonal,
                                             _event_id_Type_Event, _event_id_Place))
            data = cursor.fetchall()

            conn.commit()
            return {'StatusCode':'200', 'Message': 'Success'}

        except Exception as e:
            return {'error': str(e)}


api.add_resource(CreateUser, '/CreateUser')
api.add_resource(AddEvent, '/AddEvent')

if __name__ == '__main__':
    app.run(debug=True)
