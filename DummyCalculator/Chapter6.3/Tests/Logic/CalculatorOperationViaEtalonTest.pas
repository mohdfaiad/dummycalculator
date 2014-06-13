unit CalculatorOperationViaEtalonTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger;

 type
  TCalcOperation = function (const A, B: string): string of object;

  TCalculatorOperationViaEtalonTest = class(TTestCase)
   private
    procedure CheckOperation(aX1, aX2: string;
                             anOperation : TCalcOperation);
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
  end;//TCalculatorOperationViaEtalonTest

implementation

  uses
    SysUtils;


const
 cA = '5';
 cB = '10';
{ TCalculatorOperationViaEtalonTest }
procedure TCalculatorOperationViaEtalonTest.CheckOperation(aX1, aX2: string;
                                                           anOperation : TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    aLogger.ToLog(aX1);
    aLogger.ToLog(aX2);
    aLogger.ToLog(anOperation(aX1,aX2))
   end
  );
end;

procedure TCalculatorOperationViaEtalonTest.TestDiv;
var
  x1, x2 : string;
begin
  x1:= cA;
  x2:= cB;

  CheckOperation(x1, x2, TCalculator.Divide);
end;

procedure TCalculatorOperationViaEtalonTest.TestSub;
var
  x1, x2  : string;
begin
  x1:= cA;
  x2:= cB;

  CheckOperation(x1, x2, TCalculator.Sub);
end;

procedure TCalculatorOperationViaEtalonTest.TestMul;
var
  x1, x2  : string;
begin
  x1:= cA;
  x2:= cB;

  CheckOperation(x1, x2, TCalculator.Mul);
end;

procedure TCalculatorOperationViaEtalonTest.TestAdd;
var
  x1, x2  : string;
begin
  x1:= cA;
  x2:= cB;

  CheckOperation(x1, x2, TCalculator.Add);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaEtalonTest.Suite);
end.
