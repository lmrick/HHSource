package package_78
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1621
   {
      
      public static const const_58:int = 0;
      
      public static const const_377:int = 1;
      
      public static const const_117:int = 2;
      
      public static const const_325:int = 4;
      
      public static const const_299:int = 5;
       
      
      private var var_1059:int;
      
      private var var_724:int;
      
      private var var_868:int;
      
      public function class_1621(param1:IMessageDataWrapper)
      {
         super();
         var_1059 = param1.readInteger();
         var_724 = param1.readInteger();
         var_868 = param1.readInteger();
      }
      
      public function get whoCanMute() : int
      {
         return var_1059;
      }
      
      public function get whoCanKick() : int
      {
         return var_724;
      }
      
      public function get whoCanBan() : int
      {
         return var_868;
      }
   }
}
