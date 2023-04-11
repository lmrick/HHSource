package package_18
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import package_11.class_1569;
   
   [SecureSWF(rename="true")]
   public class class_1548
   {
       
      
      private var var_446:String;
      
      private var var_500:String;
      
      private var var_285:Vector.<package_18.class_1656>;
      
      public function class_1548(param1:IMessageDataWrapper, param2:package_18.class_1656 = null)
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var_285 = new Vector.<package_18.class_1656>(0);
         super();
         if(param2 != null)
         {
            var_446 = param2.searchCode;
            var_500 = param2.text;
            var_285.push(param2);
         }
         else
         {
            var_446 = param1.readString();
            var_500 = param1.readString();
            _loc3_ = param1.readInteger();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               var_285.push(new package_18.class_1656(param1));
               _loc4_++;
            }
         }
      }
      
      public function get searchCodeOriginal() : String
      {
         return var_446;
      }
      
      public function get filteringData() : String
      {
         return var_500;
      }
      
      public function get blocks() : Vector.<package_18.class_1656>
      {
         return var_285;
      }
      
      public function findGuestRoom(param1:int) : class_1569
      {
         var _loc3_:class_1569 = null;
         for each(var _loc2_ in var_285)
         {
            _loc3_ = _loc2_.findGuestRoom(param1);
            if(_loc3_ != null)
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}
