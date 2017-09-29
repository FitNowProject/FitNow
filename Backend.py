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
            parser.add_argument('is_worked', type=str, help='Is_Worked to create user')
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
            _userIsWorked = args['is_worked']
            _userDirection = args['direction']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spCreateUser', (_userName, _userFatLastName, _userMotLastName, _userSex, _userDni,
                                             _userBorn, _userPhone, _userEmail, _userUsername, _userPassword,
                                             _userIsWorked, _userDirection))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return {'StatusCode': '200', 'Message': 'User creation success'}
            else:
                return {'StatusCode': '1000', 'Message': str(data[0])}

        except Exception as e:
            return {'error': str(e)}


api.add_resource(CreateUser, '/CreateUser')

if __name__ == '__main__':
    app.run(debug=True)
