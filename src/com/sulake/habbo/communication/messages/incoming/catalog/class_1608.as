package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1608
   {
      
      public static const PRODUCT_TYPE_ITEM:String = "i";
      
      public static const PRODUCT_TYPE_STUFF:String = "s";
      
      public static const PRODUCT_TYPE_EFFECT:String = "e";
      
      public static const PRODUCT_TYPE_BADGE:String = "b";
       
      
      private var var_358:String;
      
      private var var_1014:int;
      
      private var var_388:String;
      
      private var var_516:int;
      
      private var var_642:Boolean;
      
      private var var_1231:int;
      
      private var var_751:int;
      
      public function class_1608(param1:IMessageDataWrapper)
      {
         super();
         var_358 = param1.readString();
         var _loc2_:String = var_358;
         if("b" !== _loc2_)
         {
            var_1014 = param1.readInteger();
            var_388 = param1.readString();
            var_516 = param1.readInteger();
            var_642 = param1.readBoolean();
            if(var_642)
            {
               var_1231 = param1.readInteger();
               var_751 = param1.readInteger();
            }
         }
         else
         {
            var_388 = param1.readString();
            var_516 = 1;
         }
      }
      
      public function get productType() : String
      {
         return var_358;
      }
      
      public function get furniClassId() : int
      {
         return var_1014;
      }
      
      public function get extraParam() : String
      {
         return var_388;
      }
      
      public function get productCount() : int
      {
         return var_516;
      }
      
      public function get uniqueLimitedItem() : Boolean
      {
         return var_642;
      }
      
      public function get uniqueLimitedItemSeriesSize() : int
      {
         return var_1231;
      }
      
      public function get uniqueLimitedItemsLeft() : int
      {
         return var_751;
      }
   }
}
