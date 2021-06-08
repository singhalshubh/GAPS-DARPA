; ModuleID = './divvied/orange/example2.mod.c'
source_filename = "./divvied/orange/example2.mod.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./divvied/orange/example2.mod.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [20 x i8] c"XDLINKAGE_GET_PRICE\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_price to i8*), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 32 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_price() #0 !dbg !7 {
  %1 = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !12, metadata !DIExpression()), !dbg !13
  %2 = bitcast double* %1 to i8*, !dbg !14
  call void @llvm.var.annotation(i8* %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 37), !dbg !14
  store double 0.000000e+00, double* %1, align 8, !dbg !13
  %3 = call i64 @time(i64* null) #4, !dbg !15
  %4 = trunc i64 %3 to i32, !dbg !15
  call void @srand(i32 %4) #4, !dbg !16
  %5 = call i32 @rand() #4, !dbg !17
  %6 = srem i32 %5, 5000, !dbg !18
  %7 = sitofp i32 %6 to double, !dbg !19
  %8 = fdiv double %7, 1.000000e+02, !dbg !20
  %9 = fadd double %8, 7.500000e+02, !dbg !21
  store double %9, double* %1, align 8, !dbg !22
  %10 = load double, double* %1, align 8, !dbg !23
  ret double %10, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "divvied/orange/example2.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)"}
!7 = distinct !DISubprogram(name: "get_price", scope: !8, file: !8, line: 32, type: !9, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./divvied/orange/example2.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example2")
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!12 = !DILocalVariable(name: "stockprice", scope: !7, file: !8, line: 37, type: !11)
!13 = !DILocation(line: 37, column: 10, scope: !7)
!14 = !DILocation(line: 37, column: 3, scope: !7)
!15 = !DILocation(line: 40, column: 9, scope: !7)
!16 = !DILocation(line: 40, column: 3, scope: !7)
!17 = !DILocation(line: 41, column: 17, scope: !7)
!18 = !DILocation(line: 41, column: 23, scope: !7)
!19 = !DILocation(line: 41, column: 16, scope: !7)
!20 = !DILocation(line: 41, column: 29, scope: !7)
!21 = !DILocation(line: 41, column: 36, scope: !7)
!22 = !DILocation(line: 41, column: 14, scope: !7)
!23 = !DILocation(line: 42, column: 10, scope: !7)
!24 = !DILocation(line: 42, column: 3, scope: !7)
