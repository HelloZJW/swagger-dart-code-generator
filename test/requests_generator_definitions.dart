const String request_with_header = '''
{
  "components":{
    "schemes" : {
      "MyCoolDefinition":{
         "type":"object",
         "properties":{
            "startTime":{
               "type":"string",
               "format":"date"
            },
            "endTime":{
               "type":"string",
               "format":"date"
            },
            "imageUrl":{
               "type":"string"
            }
         },
         "title":"MyCoolDefinition"
      }
   }
  },
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "someOperationId",
        "parameters": [
          {
            "name": "headerParameter",
            "in": "header",
            "required": true,
            "type": "string"
          }
        ],
        "requestBody" : {
          "content" : {
            "application/json" : {
              "schema" : {
                "type" : "array",
                "items" : {
                  "\$ref" : "#/components/schemas/ContentRequest"
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "originalRef": "TestItem",
                "\$ref": "#/definitions/TestItem"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_ref_response = '''
{
  "components": {
    "schemes": {
      "MyCoolDefinition": {
        "type": "object",
        "properties": {
          "startTime": {
            "type": "string",
            "format": "date"
          },
          "endTime": {
            "type": "string",
            "format": "date"
          },
          "imageUrl": {
            "type": "string"
          }
        },
        "title": "MyCoolDefinition"
      }
    },
    "responses": {
      "SpaSingleResponse": {
        "description": "Success",
        "content": {
          "application/json": {
            "schema": {
              "enum": [
                "one",
                "two"
              ]
            }
          }
        }
      },
      "SpaResponse": {
        "description": "Success",
        "content": {
          "application/json(1)": {
            "schema": {
              "enum": [
                "one",
                "two"
              ]
            }
          },
          "application/json(2)": {
            "schema": {
              "enum": [
                "one",
                "two"
              ]
            }
          }
        }
      }
    }
  },
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "someOperationId",
        "parameters": [
          {
            "name": "headerParameter",
            "in": "header",
            "required": true,
            "type": "string"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "array",
                "items": {
                  "\$ref": "#/components/responses/SpaResponse"
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "\$ref": "#/responses/SpaResponse"
          }
        }
      }
    }
  }
}
''';

const String request_with_array_string = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "originalRef": "TestItem",
                "\$ref": "#/definitions/TestItem"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_array_item_summary = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "originalRef": "ItemSummary",
                "\$ref": "#/definitions/ItemSummary"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_list_string_return_type = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_list_test_item_return_type = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "originalRef": "TestItem",
                "\$ref": "#/definitions/TestItem"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_object_ref_response = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "\$ref" : "MyObject"
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_original_ref_return_type = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "originalRef": "TestItem"
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_content_first_response_type = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "applicacion/json": {
                "schema" : {
                  "type" : "String"
                }
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_content_first_response_ref = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type" : "testType",
              "items" : {
                "\$ref" : "#definitions/TestItem"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String model_with_inheritance = '''
{
  "openapi": "3.0.0",
  "components": {
    "schemas": {
      "BasicErrorModel": {
        "type": "object",
        "required": [
          "message",
          "code"
        ],
        "properties": {
          "message": {
            "type": "string"
          },
          "code": {
            "type": "integer",
            "minimum": 100,
            "maximum": 600
          }
        }
      },
      "ExtendedErrorModel": {
        "allOf": [
          {
            "\$ref": "#/components/schemas/BasicErrorModel"
          },
          {
            "type": "object",
            "required": [
              "rootCause"
            ],
            "properties": {
              "rootCause": {
                "type": "string"
              }
            }
          }
        ]
      }
    }
  }
}
''';

const String model_with_enum = '''
{
   "openapi":"3.0.0",
   "components":{
      "schemas":{
         "BasicErrorModel":{
            "enum":[
               "message",
               "code"
            ]
         }
      }
   }
}
''';

const String model_with_inheritance_3_levels = '''
{
  "openapi": "3.0.0",
  "components": {
    "schemas": {
      "BasicErrorModel": {
        "type": "object",
        "required": [
          "message",
          "code"
        ],
        "properties": {
          "message": {
            "type": "string"
          },
          "code": {
            "type": "integer",
            "minimum": 100,
            "maximum": 600
          }
        }
      },
      "ExtendedErrorModel": {
        "allOf": [
          {
            "\$ref": "#/components/schemas/BasicErrorModel"
          },
          {
            "type": "object",
            "required": [
              "rootCause"
            ],
            "properties": {
              "rootCause": {
                "type": "string"
              }
            }
          }
        ]
      },
      "MostExtendedErrorModel": {
        "allOf": [
          {
            "\$ref": "#/components/schemas/ExtendedErrorModel"
          },
          {
            "type": "object",
            "required": [
              "rootCause"
            ],
            "properties": {
              "phone": {
                "type": "string"
              }
            }
          }
        ]
      }
    }
  }
}
''';

const request_with_enum = '''
{
  "paths": {
    "/pets/{petId}/items": {
      "get": {
        "summary": "Some summary",
        "tags": [
          "Bookmarks"
        ],
        "parameters": [
          {
            "name": "contentType",
            "in": "query",
            "description": "content source type",
            "type": "string",
            "schema": {
              "enum": [
              "vod",
              "replay",
              "network-recording",
              "local-recording"
            ]
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Bookmarks for given profile and content is returned.",
            "schema": {
              "\$ref": "#/definitions/Pet"
            }
          }
        }
      }
    }
  }
}
''';

const request_with_enum_request_body = '''
{
  "openapi": "3.0.1",
  "info": {
    "title": "Test service",
    "version": "0.18.0"
  },
  "paths": {
    "/v3/customers/{customerId}/status": {
      "put": {
        "description": "Test request",
        "parameters": [
          {
            "name": "customerId",
            "in": "path",
            "description": "Test desc",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "requestBody": {
          "description": "Test desc",
          "content": {
            "application/json": {
              "schema": {
                "\$ref": "#/components/schemas/CustomerStatus"
              }
            }
          },
          "required": true
        },
        "responses": {
          "204": {
            "description": "Customer Status was changed."
          }
        }
      }
    }
  },
  "components": {
    "schemas": {
      "CustomerStatus": {
        "title": "Customer Status",
        "type": "string",
        "enum": [
          "active",
          "inactive",
          "deleted"
        ]
      }
    }
  }
}
''';
