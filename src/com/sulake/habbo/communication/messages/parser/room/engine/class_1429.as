package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.room.utils.Vector3d;
   import package_17.class_1584;
   
   [SecureSWF(rename="true")]
   public class class_1429 implements IMessageParser
   {
       
      
      private var var_247:int;
      
      private var var_307:Array;
      
      private var var_224:class_1584 = null;
      
      public function class_1429()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get avatar() : class_1584
      {
         return var_224;
      }
      
      public function get objectList() : Array
      {
         return var_307;
      }
      
      public function flush() : Boolean
      {
         var_247 = -1;
         var_224 = null;
         var_307 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc14_:int = 0;
         var _loc7_:class_1584 = null;
         var _loc2_:Vector3d = null;
         var _loc9_:Vector3d = null;
         var _loc12_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc6_:int = 0;
         if(param1 == null)
         {
            return false;
         }
         var _loc10_:Number = param1.readInteger();
         var _loc11_:Number = param1.readInteger();
         var _loc5_:Number = param1.readInteger();
         var _loc4_:Number = param1.readInteger();
         var _loc8_:int = param1.readInteger();
         var_307 = [];
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc14_ = param1.readInteger();
            _loc12_ = Number(param1.readString());
            _loc3_ = Number(param1.readString());
            _loc2_ = new Vector3d(_loc10_,_loc11_,_loc12_);
            _loc9_ = new Vector3d(_loc5_,_loc4_,_loc3_);
            _loc7_ = new class_1584(_loc14_,_loc2_,_loc9_);
            var_307.push(_loc7_);
            _loc6_++;
         }
         var_247 = param1.readInteger();
         if(!param1.bytesAvailable)
         {
            return true;
         }
         var _loc13_:int;
         switch(_loc13_ = param1.readInteger())
         {
            case 0:
               break;
            case 1:
               _loc14_ = param1.readInteger();
               _loc12_ = Number(param1.readString());
               _loc3_ = Number(param1.readString());
               _loc2_ = new Vector3d(_loc10_,_loc11_,_loc12_);
               _loc9_ = new Vector3d(_loc5_,_loc4_,_loc3_);
               var_224 = new class_1584(_loc14_,_loc2_,_loc9_,"mv");
               break;
            case 2:
               _loc14_ = param1.readInteger();
               _loc12_ = Number(param1.readString());
               _loc3_ = Number(param1.readString());
               _loc2_ = new Vector3d(_loc10_,_loc11_,_loc12_);
               _loc9_ = new Vector3d(_loc5_,_loc4_,_loc3_);
               var_224 = new class_1584(_loc14_,_loc2_,_loc9_,"sld");
               break;
            default:
               class_14.log("** Incompatible character movetype!");
         }
         return true;
      }
   }
}
