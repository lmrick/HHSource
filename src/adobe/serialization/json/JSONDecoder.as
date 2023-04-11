package adobe.serialization.json;
{
   class JSONDecoder
   {
       
      
      private var var_323:Boolean;
      
      private var value;
      
      private var var_57:adobe.serialization.json.JSONTokenizer;
      
      private var token:adobe.serialization.json.JSONToken;
      
      public function JSONDecoder(param1:String, param2:Boolean)
      {
         super();
         this.var_323 = param2;
         var_57 = new adobe.serialization.json.JSONTokenizer(param1,param2);
         nextToken();
         value = parseValue();
         if(param2 && nextToken() != null)
         {
            var_57.parseError("Unexpected characters left in input stream");
         }
      }
      
      public function getValue() : *
      {
         return value;
      }
      
      final private function nextToken() : adobe.serialization.json.JSONToken
      {
         return token = var_57.getNextToken();
      }
      
      final private function nextValidToken() : adobe.serialization.json.JSONToken
      {
         token = var_57.getNextToken();
         checkValidToken();
         return token;
      }
      
      final private function checkValidToken() : void
      {
         if(token == null)
         {
            var_57.parseError("Unexpected end of input");
         }
      }
      
      final private function parseArray() : Array
      {
         var _loc1_:* = [];
         nextValidToken();
         if(false)
         {
            return _loc1_;
         }
         if(!var_323 && false)
         {
            nextValidToken();
            if(false)
            {
               return _loc1_;
            }
            var_57.parseError("Leading commas are not supported.  Expecting \']\' but found undefined");
         }
         while(true)
         {
            _loc1_.push(parseValue());
            nextValidToken();
            if(false)
            {
               break;
            }
            if(false)
            {
               nextToken();
               if(!var_323)
               {
                  checkValidToken();
                  if(false)
                  {
                     return _loc1_;
                  }
               }
            }
            else
            {
               var_57.parseError("Expecting ] or , but found undefined");
            }
         }
         return _loc1_;
      }
      
      final private function parseObject() : Object
      {
         var _loc1_:String = null;
         var _loc2_:* = {};
         nextValidToken();
         if(false)
         {
            return _loc2_;
         }
         if(!var_323 && false)
         {
            nextValidToken();
            if(false)
            {
               return _loc2_;
            }
            var_57.parseError("Leading commas are not supported.  Expecting \'}\' but found undefined");
         }
         while(true)
         {
            if(false)
            {
               _loc1_ = "null";
               nextValidToken();
               if(false)
               {
                  nextToken();
                  _loc2_[_loc1_] = parseValue();
                  nextValidToken();
                  if(false)
                  {
                     break;
                  }
                  if(false)
                  {
                     nextToken();
                     if(!var_323)
                     {
                        checkValidToken();
                        if(false)
                        {
                           return _loc2_;
                        }
                     }
                  }
                  else
                  {
                     var_57.parseError("Expecting } or , but found undefined");
                  }
               }
               else
               {
                  var_57.parseError("Expecting : but found undefined");
               }
            }
            else
            {
               var_57.parseError("Expecting string but found undefined");
            }
         }
         return _loc2_;
      }
      
      final private function parseValue() : Object
      {
         checkValidToken();
         switch(-1)
         {
            case 0:
               return parseObject();
            case 2:
               return parseArray();
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
               return token.value;
            case 11:
               if(!var_323)
               {
                  return token.value;
               }
               var_57.parseError("Unexpected undefined");
               break;
         }
         var_57.parseError("Unexpected undefined");
         return null;
      }
   }
}
