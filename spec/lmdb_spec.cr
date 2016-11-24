require "./spec_helper"

describe Lmdb::Environment do
  describe ".new" do
    it "works" do
      Lmdb::Environment.new(path)
    end
  end
end
