class Lmdb::Environment
  def initialize(@path : String)
    # LibLmdb.mdb_env_open ...
  end
end
