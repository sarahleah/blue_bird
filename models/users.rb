require_relative '../library/utils.rb'

def create_user(user_name, first_name, last_name, email, profile_img, password_digest)
    sql = "INSERT INTO users (user_name, first_name, last_name, email, profile_img, password_digest) VALUES ('#{user_name}', '#{first_name}', '#{last_name}', '#{email}', '#{profile_img}','#{password_digest}');"
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