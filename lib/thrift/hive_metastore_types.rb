#
# Autogenerated by Thrift Compiler (0.9.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require_relative 'fb303_types'


module HiveObjectType
  GLOBAL = 1
  DATABASE = 2
  TABLE = 3
  PARTITION = 4
  COLUMN = 5
  VALUE_MAP = {1 => "GLOBAL", 2 => "DATABASE", 3 => "TABLE", 4 => "PARTITION", 5 => "COLUMN"}
  VALID_VALUES = Set.new([GLOBAL, DATABASE, TABLE, PARTITION, COLUMN]).freeze
end

module PrincipalType
  USER = 1
  ROLE = 2
  GROUP = 3
  VALUE_MAP = {1 => "USER", 2 => "ROLE", 3 => "GROUP"}
  VALID_VALUES = Set.new([USER, ROLE, GROUP]).freeze
end

module PartitionEventType
  LOAD_DONE = 1
  VALUE_MAP = {1 => "LOAD_DONE"}
  VALID_VALUES = Set.new([LOAD_DONE]).freeze
end

class Version
  include ::Thrift::Struct, ::Thrift::Struct_Union
  VERSION = 1
  COMMENTS = 2

  FIELDS = {
    VERSION => {:type => ::Thrift::Types::STRING, :name => 'version'},
    COMMENTS => {:type => ::Thrift::Types::STRING, :name => 'comments'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class FieldSchema
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NAME = 1
  TYPE = 2
  COMMENT = 3

  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    TYPE => {:type => ::Thrift::Types::STRING, :name => 'type'},
    COMMENT => {:type => ::Thrift::Types::STRING, :name => 'comment'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Type
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NAME = 1
  TYPE1 = 2
  TYPE2 = 3
  FIELDS = 4

  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    TYPE1 => {:type => ::Thrift::Types::STRING, :name => 'type1', :optional => true},
    TYPE2 => {:type => ::Thrift::Types::STRING, :name => 'type2', :optional => true},
    FIELDS => {:type => ::Thrift::Types::LIST, :name => 'fields', :element => {:type => ::Thrift::Types::STRUCT, :class => ::FieldSchema}, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class HiveObjectRef
  include ::Thrift::Struct, ::Thrift::Struct_Union
  OBJECTTYPE = 1
  DBNAME = 2
  OBJECTNAME = 3
  PARTVALUES = 4
  COLUMNNAME = 5

  FIELDS = {
    OBJECTTYPE => {:type => ::Thrift::Types::I32, :name => 'objectType', :enum_class => ::HiveObjectType},
    DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
    OBJECTNAME => {:type => ::Thrift::Types::STRING, :name => 'objectName'},
    PARTVALUES => {:type => ::Thrift::Types::LIST, :name => 'partValues', :element => {:type => ::Thrift::Types::STRING}},
    COLUMNNAME => {:type => ::Thrift::Types::STRING, :name => 'columnName'}
  }

  def struct_fields; FIELDS; end

  def validate
    unless @objectType.nil? || ::HiveObjectType::VALID_VALUES.include?(@objectType)
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field objectType!')
    end
  end

  ::Thrift::Struct.generate_accessors self
end

class PrivilegeGrantInfo
  include ::Thrift::Struct, ::Thrift::Struct_Union
  PRIVILEGE = 1
  CREATETIME = 2
  GRANTOR = 3
  GRANTORTYPE = 4
  GRANTOPTION = 5

  FIELDS = {
    PRIVILEGE => {:type => ::Thrift::Types::STRING, :name => 'privilege'},
    CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
    GRANTOR => {:type => ::Thrift::Types::STRING, :name => 'grantor'},
    GRANTORTYPE => {:type => ::Thrift::Types::I32, :name => 'grantorType', :enum_class => ::PrincipalType},
    GRANTOPTION => {:type => ::Thrift::Types::BOOL, :name => 'grantOption'}
  }

  def struct_fields; FIELDS; end

  def validate
    unless @grantorType.nil? || ::PrincipalType::VALID_VALUES.include?(@grantorType)
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field grantorType!')
    end
  end

  ::Thrift::Struct.generate_accessors self
end

class HiveObjectPrivilege
  include ::Thrift::Struct, ::Thrift::Struct_Union
  HIVEOBJECT = 1
  PRINCIPALNAME = 2
  PRINCIPALTYPE = 3
  GRANTINFO = 4

  FIELDS = {
    HIVEOBJECT => {:type => ::Thrift::Types::STRUCT, :name => 'hiveObject', :class => ::HiveObjectRef},
    PRINCIPALNAME => {:type => ::Thrift::Types::STRING, :name => 'principalName'},
    PRINCIPALTYPE => {:type => ::Thrift::Types::I32, :name => 'principalType', :enum_class => ::PrincipalType},
    GRANTINFO => {:type => ::Thrift::Types::STRUCT, :name => 'grantInfo', :class => ::PrivilegeGrantInfo}
  }

  def struct_fields; FIELDS; end

  def validate
    unless @principalType.nil? || ::PrincipalType::VALID_VALUES.include?(@principalType)
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field principalType!')
    end
  end

  ::Thrift::Struct.generate_accessors self
end

class PrivilegeBag
  include ::Thrift::Struct, ::Thrift::Struct_Union
  PRIVILEGES = 1

  FIELDS = {
    PRIVILEGES => {:type => ::Thrift::Types::LIST, :name => 'privileges', :element => {:type => ::Thrift::Types::STRUCT, :class => ::HiveObjectPrivilege}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class PrincipalPrivilegeSet
  include ::Thrift::Struct, ::Thrift::Struct_Union
  USERPRIVILEGES = 1
  GROUPPRIVILEGES = 2
  ROLEPRIVILEGES = 3

  FIELDS = {
    USERPRIVILEGES => {:type => ::Thrift::Types::MAP, :name => 'userPrivileges', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::LIST, :element => {:type => ::Thrift::Types::STRUCT, :class => ::PrivilegeGrantInfo}}},
    GROUPPRIVILEGES => {:type => ::Thrift::Types::MAP, :name => 'groupPrivileges', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::LIST, :element => {:type => ::Thrift::Types::STRUCT, :class => ::PrivilegeGrantInfo}}},
    ROLEPRIVILEGES => {:type => ::Thrift::Types::MAP, :name => 'rolePrivileges', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::LIST, :element => {:type => ::Thrift::Types::STRUCT, :class => ::PrivilegeGrantInfo}}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Role
  include ::Thrift::Struct, ::Thrift::Struct_Union
  ROLENAME = 1
  CREATETIME = 2
  OWNERNAME = 3

  FIELDS = {
    ROLENAME => {:type => ::Thrift::Types::STRING, :name => 'roleName'},
    CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
    OWNERNAME => {:type => ::Thrift::Types::STRING, :name => 'ownerName'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Database
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NAME = 1
  DESCRIPTION = 2
  LOCATIONURI = 3
  PARAMETERS = 4
  PRIVILEGES = 5

  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    DESCRIPTION => {:type => ::Thrift::Types::STRING, :name => 'description'},
    LOCATIONURI => {:type => ::Thrift::Types::STRING, :name => 'locationUri'},
    PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
    PRIVILEGES => {:type => ::Thrift::Types::STRUCT, :name => 'privileges', :class => ::PrincipalPrivilegeSet, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class SerDeInfo
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NAME = 1
  SERIALIZATIONLIB = 2
  PARAMETERS = 3

  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    SERIALIZATIONLIB => {:type => ::Thrift::Types::STRING, :name => 'serializationLib'},
    PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Order
  include ::Thrift::Struct, ::Thrift::Struct_Union
  COL = 1
  ORDER = 2

  FIELDS = {
    COL => {:type => ::Thrift::Types::STRING, :name => 'col'},
    ORDER => {:type => ::Thrift::Types::I32, :name => 'order'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class SkewedInfo
  include ::Thrift::Struct, ::Thrift::Struct_Union
  SKEWEDCOLNAMES = 1
  SKEWEDCOLVALUES = 2
  SKEWEDCOLVALUELOCATIONMAPS = 3

  FIELDS = {
    SKEWEDCOLNAMES => {:type => ::Thrift::Types::LIST, :name => 'skewedColNames', :element => {:type => ::Thrift::Types::STRING}},
    SKEWEDCOLVALUES => {:type => ::Thrift::Types::LIST, :name => 'skewedColValues', :element => {:type => ::Thrift::Types::LIST, :element => {:type => ::Thrift::Types::STRING}}},
    SKEWEDCOLVALUELOCATIONMAPS => {:type => ::Thrift::Types::MAP, :name => 'skewedColValueLocationMaps', :key => {:type => ::Thrift::Types::LIST, :element => {:type => ::Thrift::Types::STRING}}, :value => {:type => ::Thrift::Types::STRING}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class StorageDescriptor
  include ::Thrift::Struct, ::Thrift::Struct_Union
  COLS = 1
  LOCATION = 2
  INPUTFORMAT = 3
  OUTPUTFORMAT = 4
  COMPRESSED = 5
  NUMBUCKETS = 6
  SERDEINFO = 7
  BUCKETCOLS = 8
  SORTCOLS = 9
  PARAMETERS = 10
  SKEWEDINFO = 11
  STOREDASSUBDIRECTORIES = 12

  FIELDS = {
    COLS => {:type => ::Thrift::Types::LIST, :name => 'cols', :element => {:type => ::Thrift::Types::STRUCT, :class => ::FieldSchema}},
    LOCATION => {:type => ::Thrift::Types::STRING, :name => 'location'},
    INPUTFORMAT => {:type => ::Thrift::Types::STRING, :name => 'inputFormat'},
    OUTPUTFORMAT => {:type => ::Thrift::Types::STRING, :name => 'outputFormat'},
    COMPRESSED => {:type => ::Thrift::Types::BOOL, :name => 'compressed'},
    NUMBUCKETS => {:type => ::Thrift::Types::I32, :name => 'numBuckets'},
    SERDEINFO => {:type => ::Thrift::Types::STRUCT, :name => 'serdeInfo', :class => ::SerDeInfo},
    BUCKETCOLS => {:type => ::Thrift::Types::LIST, :name => 'bucketCols', :element => {:type => ::Thrift::Types::STRING}},
    SORTCOLS => {:type => ::Thrift::Types::LIST, :name => 'sortCols', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Order}},
    PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
    SKEWEDINFO => {:type => ::Thrift::Types::STRUCT, :name => 'skewedInfo', :class => ::SkewedInfo, :optional => true},
    STOREDASSUBDIRECTORIES => {:type => ::Thrift::Types::BOOL, :name => 'storedAsSubDirectories', :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Table
  include ::Thrift::Struct, ::Thrift::Struct_Union
  TABLENAME = 1
  DBNAME = 2
  OWNER = 3
  CREATETIME = 4
  LASTACCESSTIME = 5
  RETENTION = 6
  SD = 7
  PARTITIONKEYS = 8
  PARAMETERS = 9
  VIEWORIGINALTEXT = 10
  VIEWEXPANDEDTEXT = 11
  TABLETYPE = 12
  PRIVILEGES = 13

  FIELDS = {
    TABLENAME => {:type => ::Thrift::Types::STRING, :name => 'tableName'},
    DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
    OWNER => {:type => ::Thrift::Types::STRING, :name => 'owner'},
    CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
    LASTACCESSTIME => {:type => ::Thrift::Types::I32, :name => 'lastAccessTime'},
    RETENTION => {:type => ::Thrift::Types::I32, :name => 'retention'},
    SD => {:type => ::Thrift::Types::STRUCT, :name => 'sd', :class => ::StorageDescriptor},
    PARTITIONKEYS => {:type => ::Thrift::Types::LIST, :name => 'partitionKeys', :element => {:type => ::Thrift::Types::STRUCT, :class => ::FieldSchema}},
    PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
    VIEWORIGINALTEXT => {:type => ::Thrift::Types::STRING, :name => 'viewOriginalText'},
    VIEWEXPANDEDTEXT => {:type => ::Thrift::Types::STRING, :name => 'viewExpandedText'},
    TABLETYPE => {:type => ::Thrift::Types::STRING, :name => 'tableType'},
    PRIVILEGES => {:type => ::Thrift::Types::STRUCT, :name => 'privileges', :class => ::PrincipalPrivilegeSet, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Partition
  include ::Thrift::Struct, ::Thrift::Struct_Union
  VALUES = 1
  DBNAME = 2
  TABLENAME = 3
  CREATETIME = 4
  LASTACCESSTIME = 5
  SD = 6
  PARAMETERS = 7
  PRIVILEGES = 8

  FIELDS = {
    VALUES => {:type => ::Thrift::Types::LIST, :name => 'values', :element => {:type => ::Thrift::Types::STRING}},
    DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
    TABLENAME => {:type => ::Thrift::Types::STRING, :name => 'tableName'},
    CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
    LASTACCESSTIME => {:type => ::Thrift::Types::I32, :name => 'lastAccessTime'},
    SD => {:type => ::Thrift::Types::STRUCT, :name => 'sd', :class => ::StorageDescriptor},
    PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
    PRIVILEGES => {:type => ::Thrift::Types::STRUCT, :name => 'privileges', :class => ::PrincipalPrivilegeSet, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Index
  include ::Thrift::Struct, ::Thrift::Struct_Union
  INDEXNAME = 1
  INDEXHANDLERCLASS = 2
  DBNAME = 3
  ORIGTABLENAME = 4
  CREATETIME = 5
  LASTACCESSTIME = 6
  INDEXTABLENAME = 7
  SD = 8
  PARAMETERS = 9
  DEFERREDREBUILD = 10

  FIELDS = {
    INDEXNAME => {:type => ::Thrift::Types::STRING, :name => 'indexName'},
    INDEXHANDLERCLASS => {:type => ::Thrift::Types::STRING, :name => 'indexHandlerClass'},
    DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
    ORIGTABLENAME => {:type => ::Thrift::Types::STRING, :name => 'origTableName'},
    CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
    LASTACCESSTIME => {:type => ::Thrift::Types::I32, :name => 'lastAccessTime'},
    INDEXTABLENAME => {:type => ::Thrift::Types::STRING, :name => 'indexTableName'},
    SD => {:type => ::Thrift::Types::STRUCT, :name => 'sd', :class => ::StorageDescriptor},
    PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
    DEFERREDREBUILD => {:type => ::Thrift::Types::BOOL, :name => 'deferredRebuild'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class BooleanColumnStatsData
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NUMTRUES = 1
  NUMFALSES = 2
  NUMNULLS = 3

  FIELDS = {
    NUMTRUES => {:type => ::Thrift::Types::I64, :name => 'numTrues'},
    NUMFALSES => {:type => ::Thrift::Types::I64, :name => 'numFalses'},
    NUMNULLS => {:type => ::Thrift::Types::I64, :name => 'numNulls'}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numTrues is unset!') unless @numTrues
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numFalses is unset!') unless @numFalses
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numNulls is unset!') unless @numNulls
  end

  ::Thrift::Struct.generate_accessors self
end

class DoubleColumnStatsData
  include ::Thrift::Struct, ::Thrift::Struct_Union
  LOWVALUE = 1
  HIGHVALUE = 2
  NUMNULLS = 3
  NUMDVS = 4

  FIELDS = {
    LOWVALUE => {:type => ::Thrift::Types::DOUBLE, :name => 'lowValue'},
    HIGHVALUE => {:type => ::Thrift::Types::DOUBLE, :name => 'highValue'},
    NUMNULLS => {:type => ::Thrift::Types::I64, :name => 'numNulls'},
    NUMDVS => {:type => ::Thrift::Types::I64, :name => 'numDVs'}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field lowValue is unset!') unless @lowValue
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field highValue is unset!') unless @highValue
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numNulls is unset!') unless @numNulls
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numDVs is unset!') unless @numDVs
  end

  ::Thrift::Struct.generate_accessors self
end

class LongColumnStatsData
  include ::Thrift::Struct, ::Thrift::Struct_Union
  LOWVALUE = 1
  HIGHVALUE = 2
  NUMNULLS = 3
  NUMDVS = 4

  FIELDS = {
    LOWVALUE => {:type => ::Thrift::Types::I64, :name => 'lowValue'},
    HIGHVALUE => {:type => ::Thrift::Types::I64, :name => 'highValue'},
    NUMNULLS => {:type => ::Thrift::Types::I64, :name => 'numNulls'},
    NUMDVS => {:type => ::Thrift::Types::I64, :name => 'numDVs'}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field lowValue is unset!') unless @lowValue
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field highValue is unset!') unless @highValue
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numNulls is unset!') unless @numNulls
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numDVs is unset!') unless @numDVs
  end

  ::Thrift::Struct.generate_accessors self
end

class StringColumnStatsData
  include ::Thrift::Struct, ::Thrift::Struct_Union
  MAXCOLLEN = 1
  AVGCOLLEN = 2
  NUMNULLS = 3
  NUMDVS = 4

  FIELDS = {
    MAXCOLLEN => {:type => ::Thrift::Types::I64, :name => 'maxColLen'},
    AVGCOLLEN => {:type => ::Thrift::Types::DOUBLE, :name => 'avgColLen'},
    NUMNULLS => {:type => ::Thrift::Types::I64, :name => 'numNulls'},
    NUMDVS => {:type => ::Thrift::Types::I64, :name => 'numDVs'}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field maxColLen is unset!') unless @maxColLen
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field avgColLen is unset!') unless @avgColLen
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numNulls is unset!') unless @numNulls
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numDVs is unset!') unless @numDVs
  end

  ::Thrift::Struct.generate_accessors self
end

class BinaryColumnStatsData
  include ::Thrift::Struct, ::Thrift::Struct_Union
  MAXCOLLEN = 1
  AVGCOLLEN = 2
  NUMNULLS = 3

  FIELDS = {
    MAXCOLLEN => {:type => ::Thrift::Types::I64, :name => 'maxColLen'},
    AVGCOLLEN => {:type => ::Thrift::Types::DOUBLE, :name => 'avgColLen'},
    NUMNULLS => {:type => ::Thrift::Types::I64, :name => 'numNulls'}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field maxColLen is unset!') unless @maxColLen
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field avgColLen is unset!') unless @avgColLen
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field numNulls is unset!') unless @numNulls
  end

  ::Thrift::Struct.generate_accessors self
end

class ColumnStatisticsData < ::Thrift::Union
  include ::Thrift::Struct_Union
  class << self
    def booleanStats(val)
      ColumnStatisticsData.new(:booleanStats, val)
    end

    def longStats(val)
      ColumnStatisticsData.new(:longStats, val)
    end

    def doubleStats(val)
      ColumnStatisticsData.new(:doubleStats, val)
    end

    def stringStats(val)
      ColumnStatisticsData.new(:stringStats, val)
    end

    def binaryStats(val)
      ColumnStatisticsData.new(:binaryStats, val)
    end
  end

  BOOLEANSTATS = 1
  LONGSTATS = 2
  DOUBLESTATS = 3
  STRINGSTATS = 4
  BINARYSTATS = 5

  FIELDS = {
    BOOLEANSTATS => {:type => ::Thrift::Types::STRUCT, :name => 'booleanStats', :class => ::BooleanColumnStatsData},
    LONGSTATS => {:type => ::Thrift::Types::STRUCT, :name => 'longStats', :class => ::LongColumnStatsData},
    DOUBLESTATS => {:type => ::Thrift::Types::STRUCT, :name => 'doubleStats', :class => ::DoubleColumnStatsData},
    STRINGSTATS => {:type => ::Thrift::Types::STRUCT, :name => 'stringStats', :class => ::StringColumnStatsData},
    BINARYSTATS => {:type => ::Thrift::Types::STRUCT, :name => 'binaryStats', :class => ::BinaryColumnStatsData}
  }

  def struct_fields; FIELDS; end

  def validate
    raise(StandardError, 'Union fields are not set.') if get_set_field.nil? || get_value.nil?
  end

  ::Thrift::Union.generate_accessors self
end

class ColumnStatisticsObj
  include ::Thrift::Struct, ::Thrift::Struct_Union
  COLNAME = 1
  COLTYPE = 2
  STATSDATA = 3

  FIELDS = {
    COLNAME => {:type => ::Thrift::Types::STRING, :name => 'colName'},
    COLTYPE => {:type => ::Thrift::Types::STRING, :name => 'colType'},
    STATSDATA => {:type => ::Thrift::Types::STRUCT, :name => 'statsData', :class => ::ColumnStatisticsData}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field colName is unset!') unless @colName
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field colType is unset!') unless @colType
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field statsData is unset!') unless @statsData
  end

  ::Thrift::Struct.generate_accessors self
end

class ColumnStatisticsDesc
  include ::Thrift::Struct, ::Thrift::Struct_Union
  ISTBLLEVEL = 1
  DBNAME = 2
  TABLENAME = 3
  PARTNAME = 4
  LASTANALYZED = 5

  FIELDS = {
    ISTBLLEVEL => {:type => ::Thrift::Types::BOOL, :name => 'isTblLevel'},
    DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
    TABLENAME => {:type => ::Thrift::Types::STRING, :name => 'tableName'},
    PARTNAME => {:type => ::Thrift::Types::STRING, :name => 'partName', :optional => true},
    LASTANALYZED => {:type => ::Thrift::Types::I64, :name => 'lastAnalyzed', :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field isTblLevel is unset!') if @isTblLevel.nil?
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field dbName is unset!') unless @dbName
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field tableName is unset!') unless @tableName
  end

  ::Thrift::Struct.generate_accessors self
end

class ColumnStatistics
  include ::Thrift::Struct, ::Thrift::Struct_Union
  STATSDESC = 1
  STATSOBJ = 2

  FIELDS = {
    STATSDESC => {:type => ::Thrift::Types::STRUCT, :name => 'statsDesc', :class => ::ColumnStatisticsDesc},
    STATSOBJ => {:type => ::Thrift::Types::LIST, :name => 'statsObj', :element => {:type => ::Thrift::Types::STRUCT, :class => ::ColumnStatisticsObj}}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field statsDesc is unset!') unless @statsDesc
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field statsObj is unset!') unless @statsObj
  end

  ::Thrift::Struct.generate_accessors self
end

class Schema
  include ::Thrift::Struct, ::Thrift::Struct_Union
  FIELDSCHEMAS = 1
  PROPERTIES = 2

  FIELDS = {
    FIELDSCHEMAS => {:type => ::Thrift::Types::LIST, :name => 'fieldSchemas', :element => {:type => ::Thrift::Types::STRUCT, :class => ::FieldSchema}},
    PROPERTIES => {:type => ::Thrift::Types::MAP, :name => 'properties', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class EnvironmentContext
  include ::Thrift::Struct, ::Thrift::Struct_Union
  PROPERTIES = 1

  FIELDS = {
    PROPERTIES => {:type => ::Thrift::Types::MAP, :name => 'properties', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class MetaException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class UnknownTableException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class UnknownDBException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class AlreadyExistsException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class InvalidPartitionException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class UnknownPartitionException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class InvalidObjectException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class NoSuchObjectException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class IndexAlreadyExistsException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class InvalidOperationException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class ConfigValSecurityException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class InvalidInputException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

