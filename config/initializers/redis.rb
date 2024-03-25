unless Rails.env.test?
  redis = Settings.redis

  # redisクライアントのインスタンスを生成してRedis.currentでアクセスできるようにする
  Redis.current = Redis.new(
    host: redis.host,
    port: redis.port,
    db: redis.db
  )
end