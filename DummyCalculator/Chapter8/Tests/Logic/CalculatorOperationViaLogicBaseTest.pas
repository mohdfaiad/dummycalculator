unit CalculatorOperationViaLogicBaseTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger
  ;

type
  TCalcOperationCode = (opAdd, opSub, opMul, opDiv);
  TCalcOperationProc = function (const A, B: string): string of object;

  TCalcOperation = record
   public
    rCode : TCalcOperationCode;
    rProc : TCalcOperationProc;
    constructor Create(aCode: TCalcOperationCode; aProc: TCalcOperationProc);
  end;//TCalcOperation

  TCalculatorOperationViaLogicBaseTest = class abstract(TTestCase)
   private
    procedure DoOpPrim(anOperation: TCalcOperation);
   protected
    procedure DoOp(aLogger: TLogger; const anOperation : TCalcOperation); virtual; abstract;
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
  end;//TCalculatorOperationViaLogicBaseTest

implementation

constructor TCalcOperation.Create(aCode: TCalcOperationCode; aProc: TCalcOperationProc);
begin
  rCode := aCode;
  rProc := aProc;
end;

procedure TCalculatorOperationViaLogicBaseTest.TestDiv;
begin
  DoOpPrim(TCalcOperation.Create(opDiv, TCalculator.Divide));
end;

procedure TCalculatorOperationViaLogicBaseTest.TestSub;
begin
  DoOpPrim(TCalcOperation.Create(opSub, TCalculator.Sub));
end;

procedure TCalculatorOperationViaLogicBaseTest.TestMul;
begin
  DoOpPrim(TCalcOperation.Create(opMul, TCalculator.Mul));
end;

procedure TCalculatorOperationViaLogicBaseTest.TestAdd;
begin
  DoOpPrim(TCalcOperation.Create(opAdd, TCalculator.Add));
end;

procedure TCalculatorOperationViaLogicBaseTest.DoOpPrim(anOperation : TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    DoOp(aLogger, anOperation);
   end
  );
end;

end.