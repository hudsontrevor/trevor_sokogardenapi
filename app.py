from flask import*
import pymysql
import pymysql.cursors

app= Flask(__name__)

@app.route("/api/signup", methods=["POST"])
def signup():
    username=request.form['username']
    email=request.form['email']
    phone = request.form ['phone']
    password=request.form['password']
    print (phone,password,email,username)
    # create connection to database
    connection= pymysql.connect(host="localhost",user="root",password="",database="trevor_sokogarden")
    # create cursor to handle sql queries
    cursor = connection.cursor()
    # create sql query
    sql="insert into users(username,email,phone,password) values(%s,%s,%s,%s)"
    # data to be saved
    data=(username,email,phone,password)
    print (data)
    # execute my sql query
    cursor.execute(sql,data)
    # save data 
    connection.commit()
    # return the response
    return jsonify({"message":"sign up successfully"})

# login
@app.route("/api/login",methods=["POST"])
def login():
    email=request.form['email']
    password=request.form['password']
    print (email,password)

    connection=pymysql.connect(host="localhost",user="root",password="",database="trevor_sokogarden")
    cursor=connection.cursor(pymysql.cursors.DictCursor)
    # create the sql query to execute
    sql="select email,phone,user_id,username from users where email=%s and password =%s"
    # data to execute the query 
    data =(email,password)
    # executte the query
    cursor.execute(sql,data)
    # check reulting rows 
    if cursor.rowcount==0:
        return jsonify({"message":"invalid credentials"})
    else:
        # get the user data
        user1=cursor.fetchone()
        return jsonify({"message":"login successful", "user":user1})









if __name__=="__main__":
    app.run(debug=True)