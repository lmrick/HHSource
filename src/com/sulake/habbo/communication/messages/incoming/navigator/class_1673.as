package package_11
{
   [SecureSWF(rename="true")]
   public class class_1673
   {
       
      
      private var var_668:int;
      
      private var var_615:int;
      
      public function class_1673()
      {
         super();
      }
      
      public function getCopy() : class_1673
      {
         var _loc1_:class_1673 = new class_1673();
         _loc1_.var_668 = this.var_668;
         _loc1_.var_615 = this.var_615;
         return _loc1_;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_668 = param1;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_615 = param1;
      }
      
      public function get pos() : int
      {
         return var_668;
      }
      
      public function get imgId() : int
      {
         return var_615;
      }
   }
}
