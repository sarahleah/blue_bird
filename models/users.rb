require_relative '../library/utils.rb'

def create_user(user_name, first_name, last_name, email, profile_img, password_digest, public_id, format)
    sql = "INSERT INTO users (user_name, first_name, last_name, email, profile_img, password_digest, public_id, format) VALUES ('#{user_name}', '#{first_name}', '#{last_name}', '#{email}', '#{profile_img}','#{password_digest}', '#{public_id}', '#{format}');"
    run_sql(sql)
end

def get_user_by_email(email)
    sql = "SELECT * FROM users WHERE email = '#{email}';"
    
    user = run_sql(sql)

    if user.count > 0
        return user[0]
    else
        return false
    end
end

def get_user_by_id(id)
    sql = "SELECT * FROM users WHERE id = #{id};"
    
    user = run_sql(sql)

    if user.count > 0
        return user[0]
    else
        return false
    end
end

def change_profile_picture(id, profile_img, public_id, format)
    sql = "UPDATE users SET profile_img = '#{profile_img}', public_id = '#{public_id}', format = '#{format}' WHERE id = #{id};"
    run_sql(sql)
    # no return value
end

def change_password(id, password_digest)
    sql = "UPDATE users SET password_digest = '#{password_digest}' WHERE id = #{id};"
    run_sql(sql)
    # no return value
end

def email_in_use?(email)
    sql = "SELECT * FROM USERS WHERE email = '#{email}'"
    result = run_sql(sql)
    result.count > 0 ? true : false
end

def user_name_in_use?(user_name)
    sql = "SELECT * FROM USERS WHERE user_name = '#{user_name}'"
    result = run_sql(sql)
    result.count > 0 ? true : false
end