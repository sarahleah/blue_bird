def get_all_posts
    sql = "SELECT * FROM posts;"
    results = run_sql(sql)
end

def create_post(sport, difficulty, location, image_url, user_id)
    sql = "INSERT INTO posts (sport, difficulty, location, photo, user_id) VALUES ('#{sport}', '#{difficulty}', '#{location}', '#{image_url}',#{user_id});"

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

def update_post(id, sport, difficulty, location, image_url)
    sql = "UPDATE posts SET sport = '#{sport}', difficulty = '#{difficulty}', location = '#{location}', image_url = '#{image_url}' WHERE id = #{id};"
    run_sql
    # no return value
end