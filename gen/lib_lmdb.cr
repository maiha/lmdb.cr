@[Include("lmdb.h", prefix: %w(mdb_), remove_prefix: false)]
@[Link("lmdb")]
lib LibLmdb
end
