#
# Autogenerated by Thrift Compiler (0.9.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

module Hive
  module Thrift
    module AdjacencyType
      CONJUNCTIVE = 0
      DISJUNCTIVE = 1
      VALUE_MAP = {0 => "CONJUNCTIVE", 1 => "DISJUNCTIVE"}
      VALID_VALUES = Set.new([CONJUNCTIVE, DISJUNCTIVE]).freeze
    end

    module NodeType
      OPERATOR = 0
      STAGE = 1
      VALUE_MAP = {0 => "OPERATOR", 1 => "STAGE"}
      VALID_VALUES = Set.new([OPERATOR, STAGE]).freeze
    end

    module OperatorType
      JOIN = 0
      MAPJOIN = 1
      EXTRACT = 2
      FILTER = 3
      FORWARD = 4
      GROUPBY = 5
      LIMIT = 6
      SCRIPT = 7
      SELECT = 8
      TABLESCAN = 9
      FILESINK = 10
      REDUCESINK = 11
      UNION = 12
      UDTF = 13
      LATERALVIEWJOIN = 14
      LATERALVIEWFORWARD = 15
      HASHTABLESINK = 16
      HASHTABLEDUMMY = 17
      VALUE_MAP = {0 => "JOIN", 1 => "MAPJOIN", 2 => "EXTRACT", 3 => "FILTER", 4 => "FORWARD", 5 => "GROUPBY", 6 => "LIMIT", 7 => "SCRIPT", 8 => "SELECT", 9 => "TABLESCAN", 10 => "FILESINK", 11 => "REDUCESINK", 12 => "UNION", 13 => "UDTF", 14 => "LATERALVIEWJOIN", 15 => "LATERALVIEWFORWARD", 16 => "HASHTABLESINK", 17 => "HASHTABLEDUMMY"}
      VALID_VALUES = Set.new([JOIN, MAPJOIN, EXTRACT, FILTER, FORWARD, GROUPBY, LIMIT, SCRIPT, SELECT, TABLESCAN, FILESINK, REDUCESINK, UNION, UDTF, LATERALVIEWJOIN, LATERALVIEWFORWARD, HASHTABLESINK, HASHTABLEDUMMY]).freeze
    end

    module TaskType
      MAP = 0
      REDUCE = 1
      OTHER = 2
      VALUE_MAP = {0 => "MAP", 1 => "REDUCE", 2 => "OTHER"}
      VALID_VALUES = Set.new([MAP, REDUCE, OTHER]).freeze
    end

    module StageType
      CONDITIONAL = 0
      COPY = 1
      DDL = 2
      MAPRED = 3
      EXPLAIN = 4
      FETCH = 5
      FUNC = 6
      MAPREDLOCAL = 7
      MOVE = 8
      STATS = 9
      DEPENDENCY_COLLECTION = 10
      COLUMNSTATS = 11
      VALUE_MAP = {0 => "CONDITIONAL", 1 => "COPY", 2 => "DDL", 3 => "MAPRED", 4 => "EXPLAIN", 5 => "FETCH", 6 => "FUNC", 7 => "MAPREDLOCAL", 8 => "MOVE", 9 => "STATS", 10 => "DEPENDENCY_COLLECTION", 11 => "COLUMNSTATS"}
      VALID_VALUES = Set.new([CONDITIONAL, COPY, DDL, MAPRED, EXPLAIN, FETCH, FUNC, MAPREDLOCAL, MOVE, STATS, DEPENDENCY_COLLECTION, COLUMNSTATS]).freeze
    end

    class Adjacency
      include ::Thrift::Struct, ::Thrift::Struct_Union
      NODE = 1
      CHILDREN = 2
      ADJACENCYTYPE = 3

      FIELDS = {
        NODE => {:type => ::Thrift::Types::STRING, :name => 'node'},
        CHILDREN => {:type => ::Thrift::Types::LIST, :name => 'children', :element => {:type => ::Thrift::Types::STRING}},
        ADJACENCYTYPE => {:type => ::Thrift::Types::I32, :name => 'adjacencyType', :enum_class => ::Hive::Thrift::AdjacencyType}
      }

      def struct_fields;
        FIELDS;
      end

      def validate
        unless @adjacencyType.nil? || ::Hive::Thrift::AdjacencyType::VALID_VALUES.include?(@adjacencyType)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field adjacencyType!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Graph
      include ::Thrift::Struct, ::Thrift::Struct_Union
      NODETYPE = 1
      ROOTS = 2
      ADJACENCYLIST = 3

      FIELDS = {
        NODETYPE => {:type => ::Thrift::Types::I32, :name => 'nodeType', :enum_class => ::Hive::Thrift::NodeType},
        ROOTS => {:type => ::Thrift::Types::LIST, :name => 'roots', :element => {:type => ::Thrift::Types::STRING}},
        ADJACENCYLIST => {:type => ::Thrift::Types::LIST, :name => 'adjacencyList', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Hive::Thrift::Adjacency}}
      }

      def struct_fields;
        FIELDS;
      end

      def validate
        unless @nodeType.nil? || ::Hive::Thrift::NodeType::VALID_VALUES.include?(@nodeType)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field nodeType!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Operator
      include ::Thrift::Struct, ::Thrift::Struct_Union
      OPERATORID = 1
      OPERATORTYPE = 2
      OPERATORATTRIBUTES = 3
      OPERATORCOUNTERS = 4
      DONE = 5
      STARTED = 6

      FIELDS = {
        OPERATORID => {:type => ::Thrift::Types::STRING, :name => 'operatorId'},
        OPERATORTYPE => {:type => ::Thrift::Types::I32, :name => 'operatorType', :enum_class => ::Hive::Thrift::OperatorType},
        OPERATORATTRIBUTES => {:type => ::Thrift::Types::MAP, :name => 'operatorAttributes', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
        OPERATORCOUNTERS => {:type => ::Thrift::Types::MAP, :name => 'operatorCounters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::I64}},
        DONE => {:type => ::Thrift::Types::BOOL, :name => 'done'},
        STARTED => {:type => ::Thrift::Types::BOOL, :name => 'started'}
      }

      def struct_fields;
        FIELDS;
      end

      def validate
        unless @operatorType.nil? || ::Hive::Thrift::OperatorType::VALID_VALUES.include?(@operatorType)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field operatorType!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Task
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TASKID = 1
      TASKTYPE = 2
      TASKATTRIBUTES = 3
      TASKCOUNTERS = 4
      OPERATORGRAPH = 5
      OPERATORLIST = 6
      DONE = 7
      STARTED = 8

      FIELDS = {
        TASKID => {:type => ::Thrift::Types::STRING, :name => 'taskId'},
        TASKTYPE => {:type => ::Thrift::Types::I32, :name => 'taskType', :enum_class => ::Hive::Thrift::TaskType},
        TASKATTRIBUTES => {:type => ::Thrift::Types::MAP, :name => 'taskAttributes', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
        TASKCOUNTERS => {:type => ::Thrift::Types::MAP, :name => 'taskCounters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::I64}},
        OPERATORGRAPH => {:type => ::Thrift::Types::STRUCT, :name => 'operatorGraph', :class => ::Hive::Thrift::Graph, :optional => true},
        OPERATORLIST => {:type => ::Thrift::Types::LIST, :name => 'operatorList', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Hive::Thrift::Operator}, :optional => true},
        DONE => {:type => ::Thrift::Types::BOOL, :name => 'done'},
        STARTED => {:type => ::Thrift::Types::BOOL, :name => 'started'}
      }

      def struct_fields;
        FIELDS;
      end

      def validate
        unless @taskType.nil? || ::Hive::Thrift::TaskType::VALID_VALUES.include?(@taskType)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field taskType!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Stage
      include ::Thrift::Struct, ::Thrift::Struct_Union
      STAGEID = 1
      STAGETYPE = 2
      STAGEATTRIBUTES = 3
      STAGECOUNTERS = 4
      TASKLIST = 5
      DONE = 6
      STARTED = 7

      FIELDS = {
        STAGEID => {:type => ::Thrift::Types::STRING, :name => 'stageId'},
        STAGETYPE => {:type => ::Thrift::Types::I32, :name => 'stageType', :enum_class => ::Hive::Thrift::StageType},
        STAGEATTRIBUTES => {:type => ::Thrift::Types::MAP, :name => 'stageAttributes', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
        STAGECOUNTERS => {:type => ::Thrift::Types::MAP, :name => 'stageCounters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::I64}},
        TASKLIST => {:type => ::Thrift::Types::LIST, :name => 'taskList', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Hive::Thrift::Task}},
        DONE => {:type => ::Thrift::Types::BOOL, :name => 'done'},
        STARTED => {:type => ::Thrift::Types::BOOL, :name => 'started'}
      }

      def struct_fields;
        FIELDS;
      end

      def validate
        unless @stageType.nil? || ::Hive::Thrift::StageType::VALID_VALUES.include?(@stageType)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field stageType!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Query
      include ::Thrift::Struct, ::Thrift::Struct_Union
      QUERYID = 1
      QUERYTYPE = 2
      QUERYATTRIBUTES = 3
      QUERYCOUNTERS = 4
      STAGEGRAPH = 5
      STAGELIST = 6
      DONE = 7
      STARTED = 8

      FIELDS = {
        QUERYID => {:type => ::Thrift::Types::STRING, :name => 'queryId'},
        QUERYTYPE => {:type => ::Thrift::Types::STRING, :name => 'queryType'},
        QUERYATTRIBUTES => {:type => ::Thrift::Types::MAP, :name => 'queryAttributes', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
        QUERYCOUNTERS => {:type => ::Thrift::Types::MAP, :name => 'queryCounters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::I64}},
        STAGEGRAPH => {:type => ::Thrift::Types::STRUCT, :name => 'stageGraph', :class => ::Hive::Thrift::Graph},
        STAGELIST => {:type => ::Thrift::Types::LIST, :name => 'stageList', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Hive::Thrift::Stage}},
        DONE => {:type => ::Thrift::Types::BOOL, :name => 'done'},
        STARTED => {:type => ::Thrift::Types::BOOL, :name => 'started'}
      }

      def struct_fields;
        FIELDS;
      end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class QueryPlan
      include ::Thrift::Struct, ::Thrift::Struct_Union
      QUERIES = 1
      DONE = 2
      STARTED = 3

      FIELDS = {
        QUERIES => {:type => ::Thrift::Types::LIST, :name => 'queries', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Hive::Thrift::Query}},
        DONE => {:type => ::Thrift::Types::BOOL, :name => 'done'},
        STARTED => {:type => ::Thrift::Types::BOOL, :name => 'started'}
      }

      def struct_fields;
        FIELDS;
      end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end
  end
end
