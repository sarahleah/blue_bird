def get_all_posts
    sql = "SELECT * FROM posts;"
    results = run_sql(sql)
end

def create_post(sport, difficulty, location, image_url, user_id, public_id, extension)
    sql = "INSERT INTO posts (sport, difficulty, location, photo, user_id, public_id, format) VALUES ('#{sport}', '#{difficulty}', '#{location}', '#{image_url}',#{user_id}, '#{public_id}', '#{extension}');"

    # returns nothing
    run_sql(sql)
end

def get_post_by_id(id)
    sql = "SELECT * FROM posts WHERE id = #{id};"
    result = run_sql(sql)
    return result[0] unless result.count == 0
    return false
end

def get_posts_by_user(user_id)
    sql = "SELECT * FROM posts WHERE user_id = #{user_id};"
    posts = run_sql(sql)
    return posts unless posts.count == 0
    return false
end

def update_post(id, sport, difficulty, location, image_url, public_id, extension)
    sql = "UPDATE posts SET sport = '#{sport}', difficulty = '#{difficulty}', location = '#{location}', photo = '#{image_url}', public_id = '#{public_id}', format = '#{extension}' WHERE id = #{id};"
    run_sql(sql)
    # no return value
end

def delete_post(id)
    sql = "DELETE FROM posts WHERE id = #{id};"
    run_sql(sql)
    # no return value
end