package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1580
   {
       
      
      private var var_247:int;
      
      private var _color:uint;
      
      public function class_1580(param1:IMessageDataWrapper)
      {
         super();
         var_247 = param1.readInteger();
         _color = parseInt(param1.readString(),16);
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get red() : int
      {
         return _color >> 16 & 255;
      }
      
      public function get green() : int
      {
         return _color >> 8 & 255;
      }
      
      public function get blue() : int
      {
         return _color >> 0 & 255;
      }
   }
}
