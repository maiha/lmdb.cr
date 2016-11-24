@[Link("lmdb")]
lib LibLmdb
  fun mdb_version(major : LibC::Int*, minor : LibC::Int*, patch : LibC::Int*) : LibC::Char*
  fun mdb_strerror(err : LibC::Int) : LibC::Char*
  fun mdb_env_create(env : MdbEnv*) : LibC::Int
  type MdbEnv = Void*
  fun mdb_env_open(env : MdbEnv, path : LibC::Char*, flags : LibC::UInt, mode : MdbModeT) : LibC::Int
  alias X__ModeT = LibC::UInt
  alias ModeT = X__ModeT
  alias MdbModeT = ModeT
  fun mdb_env_copy(env : MdbEnv, path : LibC::Char*) : LibC::Int
  fun mdb_env_copyfd(env : MdbEnv, fd : MdbFilehandleT) : LibC::Int
  alias MdbFilehandleT = LibC::Int
  fun mdb_env_copy2(env : MdbEnv, path : LibC::Char*, flags : LibC::UInt) : LibC::Int
  fun mdb_env_copyfd2(env : MdbEnv, fd : MdbFilehandleT, flags : LibC::UInt) : LibC::Int
  fun mdb_env_stat(env : MdbEnv, stat : MdbStat*) : LibC::Int
  struct MdbStat
    ms_psize : LibC::UInt
    ms_depth : LibC::UInt
    ms_branch_pages : LibC::SizeT
    ms_leaf_pages : LibC::SizeT
    ms_overflow_pages : LibC::SizeT
    ms_entries : LibC::SizeT
  end
  fun mdb_env_info(env : MdbEnv, stat : MdbEnvinfo*) : LibC::Int
  struct MdbEnvinfo
    me_mapaddr : Void*
    me_mapsize : LibC::SizeT
    me_last_pgno : LibC::SizeT
    me_last_txnid : LibC::SizeT
    me_maxreaders : LibC::UInt
    me_numreaders : LibC::UInt
  end
  fun mdb_env_sync(env : MdbEnv, force : LibC::Int) : LibC::Int
  fun mdb_env_close(env : MdbEnv)
  fun mdb_env_set_flags(env : MdbEnv, flags : LibC::UInt, onoff : LibC::Int) : LibC::Int
  fun mdb_env_get_flags(env : MdbEnv, flags : LibC::UInt*) : LibC::Int
  fun mdb_env_get_path(env : MdbEnv, path : LibC::Char**) : LibC::Int
  fun mdb_env_get_fd(env : MdbEnv, fd : MdbFilehandleT*) : LibC::Int
  fun mdb_env_set_mapsize(env : MdbEnv, size : LibC::SizeT) : LibC::Int
  fun mdb_env_set_maxreaders(env : MdbEnv, readers : LibC::UInt) : LibC::Int
  fun mdb_env_get_maxreaders(env : MdbEnv, readers : LibC::UInt*) : LibC::Int
  fun mdb_env_set_maxdbs(env : MdbEnv, dbs : MdbDbi) : LibC::Int
  alias MdbDbi = LibC::UInt
  fun mdb_env_get_maxkeysize(env : MdbEnv) : LibC::Int
  fun mdb_env_set_userctx(env : MdbEnv, ctx : Void*) : LibC::Int
  fun mdb_env_get_userctx(env : MdbEnv) : Void*
  fun mdb_env_set_assert(env : MdbEnv, func : (MdbEnv, LibC::Char* -> Void)) : LibC::Int
  fun mdb_txn_begin(env : MdbEnv, parent : MdbTxn, flags : LibC::UInt, txn : MdbTxn*) : LibC::Int
  type MdbTxn = Void*
  fun mdb_txn_env(txn : MdbTxn) : MdbEnv
  fun mdb_txn_id(txn : MdbTxn) : LibC::SizeT
  fun mdb_txn_commit(txn : MdbTxn) : LibC::Int
  fun mdb_txn_abort(txn : MdbTxn)
  fun mdb_txn_reset(txn : MdbTxn)
  fun mdb_txn_renew(txn : MdbTxn) : LibC::Int
  fun mdb_dbi_open(txn : MdbTxn, name : LibC::Char*, flags : LibC::UInt, dbi : MdbDbi*) : LibC::Int
  fun mdb_stat(txn : MdbTxn, dbi : MdbDbi, stat : MdbStat*) : LibC::Int
  fun mdb_dbi_flags(txn : MdbTxn, dbi : MdbDbi, flags : LibC::UInt*) : LibC::Int
  fun mdb_dbi_close(env : MdbEnv, dbi : MdbDbi)
  fun mdb_drop(txn : MdbTxn, dbi : MdbDbi, del : LibC::Int) : LibC::Int
  fun mdb_set_compare(txn : MdbTxn, dbi : MdbDbi, cmp : (MdbVal*, MdbVal* -> LibC::Int)) : LibC::Int
  struct MdbVal
    mv_size : LibC::SizeT
    mv_data : Void*
  end
  fun mdb_set_dupsort(txn : MdbTxn, dbi : MdbDbi, cmp : (MdbVal*, MdbVal* -> LibC::Int)) : LibC::Int
  fun mdb_set_relfunc(txn : MdbTxn, dbi : MdbDbi, rel : (MdbVal*, Void*, Void*, Void* -> Void)) : LibC::Int
  fun mdb_set_relctx(txn : MdbTxn, dbi : MdbDbi, ctx : Void*) : LibC::Int
  fun mdb_get(txn : MdbTxn, dbi : MdbDbi, key : MdbVal*, data : MdbVal*) : LibC::Int
  fun mdb_put(txn : MdbTxn, dbi : MdbDbi, key : MdbVal*, data : MdbVal*, flags : LibC::UInt) : LibC::Int
  fun mdb_del(txn : MdbTxn, dbi : MdbDbi, key : MdbVal*, data : MdbVal*) : LibC::Int
  fun mdb_cursor_open(txn : MdbTxn, dbi : MdbDbi, cursor : MdbCursor*) : LibC::Int
  type MdbCursor = Void*
  fun mdb_cursor_close(cursor : MdbCursor)
  fun mdb_cursor_renew(txn : MdbTxn, cursor : MdbCursor) : LibC::Int
  fun mdb_cursor_txn(cursor : MdbCursor) : MdbTxn
  fun mdb_cursor_dbi(cursor : MdbCursor) : MdbDbi
  fun mdb_cursor_get(cursor : MdbCursor, key : MdbVal*, data : MdbVal*, op : MdbCursorOp) : LibC::Int
  enum MdbCursorOp
    MdbFirst = 0
    MdbFirstDup = 1
    MdbGetBoth = 2
    MdbGetBothRange = 3
    MdbGetCurrent = 4
    MdbGetMultiple = 5
    MdbLast = 6
    MdbLastDup = 7
    MdbNext = 8
    MdbNextDup = 9
    MdbNextMultiple = 10
    MdbNextNodup = 11
    MdbPrev = 12
    MdbPrevDup = 13
    MdbPrevNodup = 14
    MdbSet = 15
    MdbSetKey = 16
    MdbSetRange = 17
  end
  fun mdb_cursor_put(cursor : MdbCursor, key : MdbVal*, data : MdbVal*, flags : LibC::UInt) : LibC::Int
  fun mdb_cursor_del(cursor : MdbCursor, flags : LibC::UInt) : LibC::Int
  fun mdb_cursor_count(cursor : MdbCursor, countp : LibC::SizeT*) : LibC::Int
  fun mdb_cmp(txn : MdbTxn, dbi : MdbDbi, a : MdbVal*, b : MdbVal*) : LibC::Int
  fun mdb_dcmp(txn : MdbTxn, dbi : MdbDbi, a : MdbVal*, b : MdbVal*) : LibC::Int
  fun mdb_reader_list(env : MdbEnv, func : (LibC::Char*, Void* -> LibC::Int), ctx : Void*) : LibC::Int
  fun mdb_reader_check(env : MdbEnv, dead : LibC::Int*) : LibC::Int
end

