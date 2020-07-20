import kiwi, vcl, types

type
  TMainForm = ref object of TForm

var
  mainForm: TMainForm
  btn1: TButton
  btn2: TButton


proc onFormResize(sender: pointer) =
    let s = newSolver()
    let btn1_left = newVariable()
    let btn1_width = newVariable()
    let btn2_left = newVariable()
    let btn2_width = newVariable()

    s.addConstraint(btn1_left == 10.0)
    s.addConstraint(btn2_width == btn1_width * 2)
    s.addConstraint(btn2_left == btn1_left + btn1_width + 5)
    s.addConstraint(10 + btn1_width + 5 + btn2_width + 10 == float(mainForm.Width))
    s.updateVariables()

    btn1.Left = int32(btn1_left.value)
    btn1.Width = int32(btn1_width.value)
    btn2.Left = int32(btn2_left.value)
    btn2.Width = int32(btn2_width.value)

Application.Title = "Nim: LCL Application"
Application.Initialize
Application.CreateForm(mainForm)

mainForm.Position = poScreenCenter
mainForm.Caption = "Nim: LCL Form"
mainForm.OnResize = onFormResize

btn1 = NewButton(mainForm)
btn1.Parent = mainForm
btn1.Caption = "Button1"

btn2 = NewButton(mainForm)
btn2.Parent = mainForm
btn2.Caption = "Button2"

# run
Application.Run

echo("end.")
