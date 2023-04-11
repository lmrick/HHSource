package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1668 implements class_13
   {
       
      
      private var var_93:int;
      
      private var var_109:int;
      
      private var var_129:Array;
      
      private var _disposed:Boolean;
      
      public function class_1668(param1:IMessageDataWrapper)
      {
         var _loc4_:int = 0;
         var _loc3_:class_1673 = null;
         var_129 = [];
         super();
         if(param1 == null)
         {
            return;
         }
         var_93 = param1.readInteger();
         var_109 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = new class_1673();
            _loc3_.pos = param1.readInteger();
            _loc3_.imgId = param1.readInteger();
            var_129.push(_loc3_);
            _loc4_++;
         }
         if(var_93 == 0)
         {
            setDefaults();
         }
      }
      
      public function setDefaults() : void
      {
         var_93 = 1;
         var_109 = 0;
         var _loc1_:class_1673 = new class_1673();
         _loc1_.pos = 4;
         _loc1_.imgId = 1;
         var_129.push(_loc1_);
      }
      
      public function getCopy() : class_1668
      {
         var _loc1_:class_1668 = new class_1668(null);
         _loc1_.var_93 = this.var_93;
         _loc1_.var_109 = this.var_109;
         for each(var _loc2_ in var_129)
         {
            _loc1_.var_129.push(_loc2_.getCopy());
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_129 = null;
      }
      
      public function getAsString() : String
      {
         var _loc1_:String = var_109 + ";";
         _loc1_ += var_93 + ";";
         for each(var _loc2_ in var_129)
         {
            _loc1_ += _loc2_.imgId + "," + _loc2_.pos + ";";
         }
         return _loc1_;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get bgImgId() : int
      {
         return var_93;
      }
      
      public function get frontImgId() : int
      {
         return var_109;
      }
      
      public function get objects() : Array
      {
         return var_129;
      }
      
      public function set bgImgId(param1:int) : void
      {
         var_93 = param1;
      }
      
      public function set frontImgId(param1:int) : void
      {
         var_109 = param1;
      }
   }
}
