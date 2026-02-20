from flask import*
import pymysql
import os

app= Flask(__name__)
app.config['UPLOAD_FOLDER']="static/images"

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

@app.route("/api/add_product",methods=["POST"])
def addProducts():
    product_name =request.form['product_name']
    product_description=request.form['product_description']
    product_category=request.form['product_category']
    product_cost=request.form['product_cost']
    product_image=request.files['product_image']


    print(product_name,product_description,product_category,product_cost,product_image)
     # get image name
    image_name=product_image.filename
    # save the image to folder
    file_path= os.path.join(app.config['UPLOAD_FOLDER'],image_name)
    product_image.save(file_path)

    # saving product details to database
    connection=pymysql.connect(host="localhost",user="root",password="",database="trevor_sokogarden")
    cursor=connection.cursor()
    sql="insert into product_details (product_name,product_description,product_category,product_cost,product_image) values(%s,%s,%s,%s,%s) "
    data=(product_name,product_description,product_category,product_cost,image_name)
    cursor.execute(sql,data)
    connection.commit()
    return jsonify({"message":"product entered added successfully"})


    
    





if __name__=="__main__":
    app.run(debug=True)