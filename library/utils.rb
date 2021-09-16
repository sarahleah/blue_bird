require 'pg'

def run_sql(sql)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'bluebird'})

    results = db.exec(sql)

    db.close

    results
end

def logged_in?
    session[:user_id] ? true : false
end

def current_user
    user = get_user_by_id(session[:user_id])
end
