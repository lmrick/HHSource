package package_74
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1604
   {
       
      
      private var var_800:int;
      
      private var var_706:int;
      
      private var var_659:Vector.<package_74.class_1665>;
      
      public function class_1604(param1:IMessageDataWrapper)
      {
         var _loc2_:int = 0;
         super();
         var_800 = param1.readInteger();
         var_706 = param1.readInteger();
         var_659 = new Vector.<package_74.class_1665>(0);
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_659.push(new package_74.class_1665(param1));
            _loc2_++;
         }
      }
      
      public function get dayIndex() : int
      {
         return var_800;
      }
      
      public function get stepIndex() : int
      {
         return var_706;
      }
      
      public function get options() : Vector.<package_74.class_1665>
      {
         return var_659;
      }
   }
}
