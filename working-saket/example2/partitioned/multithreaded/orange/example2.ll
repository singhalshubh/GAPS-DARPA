; ModuleID = './partitioned/multithreaded/orange/example2.c'
source_filename = "./partitioned/multithreaded/orange/example2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@get_a.a = internal global double 0.000000e+00, align 8, !dbg !0
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [46 x i8] c"./partitioned/multithreaded/orange/example2.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [11 x i8] c"%f,%f, %f\0A\00", align 1
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 27 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_a() #0 !dbg !2 {
  %1 = load double, double* @get_a.a, align 8, !dbg !15
  %2 = fadd double %1, 1.000000e+00, !dbg !15
  store double %2, double* @get_a.a, align 8, !dbg !15
  %3 = load double, double* @get_a.a, align 8, !dbg !16
  ret double %3, !dbg !17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !18 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata double* %2, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata double* %3, metadata !26, metadata !DIExpression()), !dbg !27
  %5 = bitcast double* %3 to i8*, !dbg !28
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 41), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %4, metadata !29, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %4, align 4, !dbg !31
  br label %6, !dbg !32

6:                                                ; preds = %17, %0
  %7 = load i32, i32* %4, align 4, !dbg !33
  %8 = icmp slt i32 %7, 10, !dbg !35
  br i1 %8, label %9, label %20, !dbg !36

9:                                                ; preds = %6
  %10 = call double @get_a(), !dbg !37
  store double %10, double* %1, align 8, !dbg !39
  %11 = load double, double* %1, align 8, !dbg !40
  %12 = call double @_rpc_get_ewma(double %11, i32* null, i32* null), !dbg !41
  store double %12, double* %3, align 8, !dbg !42
  %13 = load double, double* %1, align 8, !dbg !43
  %14 = load double, double* %2, align 8, !dbg !44
  %15 = load double, double* %3, align 8, !dbg !45
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), double %13, double %14, double %15), !dbg !46
  br label %17, !dbg !47

17:                                               ; preds = %9
  %18 = load i32, i32* %4, align 4, !dbg !48
  %19 = add nsw i32 %18, 1, !dbg !48
  store i32 %19, i32* %4, align 4, !dbg !48
  br label %6, !dbg !49, !llvm.loop !50

20:                                               ; preds = %6
  ret i32 0, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local double @_rpc_get_ewma(double, i32*, i32*) #3

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !53 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void (...) @_master_rpc_init(), !dbg !54
  %2 = call i32 @ewma_main(), !dbg !55
  ret i32 %2, !dbg !56
}

declare dso_local void @_master_rpc_init(...) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 27, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 24, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./partitioned/multithreaded/orange/example2.c", directory: "/workspaces/build/apps/examples/example2")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "partitioned/multithreaded/orange/example2.c", directory: "/workspaces/build/apps/examples/example2")
!9 = !{}
!10 = !{!0}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!15 = !DILocation(line: 30, column: 5, scope: !2)
!16 = !DILocation(line: 31, column: 10, scope: !2)
!17 = !DILocation(line: 31, column: 3, scope: !2)
!18 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 36, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!19 = !DISubroutineType(types: !20)
!20 = !{!21}
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocalVariable(name: "x", scope: !18, file: !3, line: 37, type: !6)
!23 = !DILocation(line: 37, column: 10, scope: !18)
!24 = !DILocalVariable(name: "y", scope: !18, file: !3, line: 38, type: !6)
!25 = !DILocation(line: 38, column: 10, scope: !18)
!26 = !DILocalVariable(name: "ewma", scope: !18, file: !3, line: 41, type: !6)
!27 = !DILocation(line: 41, column: 10, scope: !18)
!28 = !DILocation(line: 41, column: 3, scope: !18)
!29 = !DILocalVariable(name: "i", scope: !30, file: !3, line: 44, type: !21)
!30 = distinct !DILexicalBlock(scope: !18, file: !3, line: 44, column: 3)
!31 = !DILocation(line: 44, column: 12, scope: !30)
!32 = !DILocation(line: 44, column: 8, scope: !30)
!33 = !DILocation(line: 44, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !3, line: 44, column: 3)
!35 = !DILocation(line: 44, column: 19, scope: !34)
!36 = !DILocation(line: 44, column: 3, scope: !30)
!37 = !DILocation(line: 45, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !3, line: 44, column: 30)
!39 = !DILocation(line: 45, column: 7, scope: !38)
!40 = !DILocation(line: 46, column: 26, scope: !38)
!41 = !DILocation(line: 46, column: 12, scope: !38)
!42 = !DILocation(line: 46, column: 10, scope: !38)
!43 = !DILocation(line: 47, column: 26, scope: !38)
!44 = !DILocation(line: 47, column: 28, scope: !38)
!45 = !DILocation(line: 47, column: 31, scope: !38)
!46 = !DILocation(line: 47, column: 5, scope: !38)
!47 = !DILocation(line: 48, column: 3, scope: !38)
!48 = !DILocation(line: 44, column: 26, scope: !34)
!49 = !DILocation(line: 44, column: 3, scope: !34)
!50 = distinct !{!50, !36, !51}
!51 = !DILocation(line: 48, column: 3, scope: !30)
!52 = !DILocation(line: 49, column: 3, scope: !18)
!53 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 52, type: !19, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!54 = !DILocation(line: 53, column: 3, scope: !53)
!55 = !DILocation(line: 54, column: 10, scope: !53)
!56 = !DILocation(line: 54, column: 3, scope: !53)
