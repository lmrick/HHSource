package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1552
   {
       
      
      private var var_1266:int;
      
      private var var_785:int;
      
      private var _color:String;
      
      private var var_759:int;
      
      private var var_586:int;
      
      private var var_266:Array;
      
      public function class_1552(param1:IMessageDataWrapper)
      {
         var _loc2_:int = 0;
         super();
         var_1266 = param1.readInteger();
         var_785 = param1.readInteger();
         _color = param1.readString();
         var_759 = param1.readInteger();
         var_266 = [];
         var_586 = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < var_586)
         {
            var_266.push(param1.readInteger());
            var_266.push(param1.readInteger());
            var_266.push(param1.readInteger());
            _loc2_++;
         }
      }
      
      public function get typeId() : int
      {
         return var_1266;
      }
      
      public function get paletteId() : int
      {
         return var_785;
      }
      
      public function get color() : String
      {
         return _color;
      }
      
      public function get breedId() : int
      {
         return var_759;
      }
      
      public function get figureString() : String
      {
         var _loc2_:String = typeId + " " + paletteId + " " + color;
         _loc2_ += " " + customPartCount;
         for each(var _loc1_ in customParts)
         {
            _loc2_ += " " + _loc1_;
         }
         return _loc2_;
      }
      
      public function get customParts() : Array
      {
         return var_266;
      }
      
      public function get customPartCount() : int
      {
         return var_586;
      }
   }
}
