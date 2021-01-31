; ModuleID = 'test.bc'
source_filename = "test.cc"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@called_back_edge = dso_local global i8 0, align 1

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z1Bv() #0 {
entry:
  call void @_Z1Ev()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z1Ev() #1 {
entry:
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z1Cv() #0 {
entry:
  call void @_Z1Dv()
  call void @_Z1Gv()
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z1Dv() #0 {
entry:
  call void @_Z1Ev()
  call void @_Z1Fv()
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z1Gv() #0 {
entry:
  call void @_Z1Fv()
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z1Fv() #0 {
entry:
  %0 = load i8, i8* @called_back_edge, align 1
  %tobool = trunc i8 %0 to i1
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i8 1, i8* @called_back_edge, align 1
  call void @_Z1Cv()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @_Z1Hv()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z1Hv() #1 {
entry:
  ret void
}

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #2 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @_Z1Bv()
  call void @_Z1Cv()
  ret i32 0
}

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "instrument-function-entry-inlined"="mcount" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "instrument-function-entry-inlined"="mcount" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "instrument-function-entry-inlined"="mcount" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 "}
