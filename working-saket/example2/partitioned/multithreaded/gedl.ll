; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global.annotations = appending global [3 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 26 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1.4, i32 0, i32 0), i32 33 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double (double)* @get_ewma to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2.7, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1.4, i32 0, i32 0), i32 42 }], section "llvm.metadata"
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !0
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [36 x i8] c"./divvied-working/orange/example2.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@get_b.b = internal global double 0.000000e+00, align 8, !dbg !11
@.str.3 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [36 x i8] c"./divvied-working/purple/example2.c\00", section "llvm.metadata"
@.str.2.7 = private unnamed_addr constant [19 x i8] c"XDLINKAGE_GET_EWMA\00", section "llvm.metadata"
@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !18

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_a() #0 !dbg !2 {
  %1 = load double, double* @get_a.a, align 8, !dbg !27
  %2 = fadd double %1, 1.000000e+00, !dbg !27
  store double %2, double* @get_a.a, align 8, !dbg !27
  %3 = load double, double* @get_a.a, align 8, !dbg !28
  ret double %3, !dbg !29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !30 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata double* %2, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata double* %3, metadata !38, metadata !DIExpression()), !dbg !39
  %5 = bitcast double* %3 to i8*, !dbg !40
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 40), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %4, metadata !41, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %4, align 4, !dbg !43
  br label %6, !dbg !44

6:                                                ; preds = %16, %0
  %7 = load i32, i32* %4, align 4, !dbg !45
  %8 = icmp slt i32 %7, 10, !dbg !47
  br i1 %8, label %9, label %19, !dbg !48

9:                                                ; preds = %6
  %10 = call double @get_a() #4, !dbg !49
  store double %10, double* %1, align 8, !dbg !51
  %11 = load double, double* %1, align 8, !dbg !52
  %12 = call i32 (double, ...) bitcast (double (double)* @get_ewma to i32 (double, ...)*)(double %11) #4, !dbg !53
  %13 = sitofp i32 %12 to double, !dbg !53
  store double %13, double* %3, align 8, !dbg !54
  %14 = load double, double* %3, align 8, !dbg !55
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %14) #4, !dbg !56
  br label %16, !dbg !57

16:                                               ; preds = %9
  %17 = load i32, i32* %4, align 4, !dbg !58
  %18 = add nsw i32 %17, 1, !dbg !58
  store i32 %18, i32* %4, align 4, !dbg !58
  br label %6, !dbg !59, !llvm.loop !60

19:                                               ; preds = %6
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !63 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = call i32 @ewma_main() #4, !dbg !64
  ret i32 %2, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_ewma(double %0) #0 !dbg !66 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, double* %2, align 8
  call void @llvm.dbg.declare(metadata double* %2, metadata !69, metadata !DIExpression()), !dbg !70
  %4 = bitcast double* %2 to i8*
  call void @llvm.var.annotation(i8* %4, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2.7, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1.4, i32 0, i32 0), i32 42)
  call void @llvm.dbg.declare(metadata double* %3, metadata !71, metadata !DIExpression()), !dbg !72
  %5 = call double @get_b() #4, !dbg !73
  store double %5, double* %3, align 8, !dbg !72
  %6 = load double, double* %2, align 8, !dbg !74
  %7 = load double, double* %3, align 8, !dbg !75
  %8 = call double @calc_ewma(double %6, double %7) #4, !dbg !76
  ret double %8, !dbg !77
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !13 {
  %1 = load double, double* @get_b.b, align 8, !dbg !78
  %2 = fadd double %1, 1.000000e+00, !dbg !78
  store double %2, double* @get_b.b, align 8, !dbg !78
  %3 = load double, double* @get_b.b, align 8, !dbg !79
  ret double %3, !dbg !80
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !20 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !81, metadata !DIExpression()), !dbg !82
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata double* %5, metadata !85, metadata !DIExpression()), !dbg !87
  store double 1.000000e+00, double* %5, align 8, !dbg !87
  %6 = load double, double* %3, align 8, !dbg !88
  %7 = load double, double* %4, align 8, !dbg !89
  %8 = fadd double %6, %7, !dbg !90
  %9 = fmul double 1.000000e+00, %8, !dbg !91
  %10 = load double, double* @calc_ewma.c, align 8, !dbg !92
  %11 = fmul double 0.000000e+00, %10, !dbg !93
  %12 = fadd double %9, %11, !dbg !94
  store double %12, double* @calc_ewma.c, align 8, !dbg !95
  %13 = load double, double* @calc_ewma.c, align 8, !dbg !96
  ret double %13, !dbg !97
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!7, !15}
!llvm.ident = !{!23, !23}
!llvm.module.flags = !{!24, !25, !26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 23, type: !4, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./divvied-working/orange/example2.c", directory: "/workspaces/build/apps/examples/example2")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "divvied-working/orange/example2.c", directory: "/workspaces/build/apps/examples/example2")
!9 = !{}
!10 = !{!0}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "b", scope: !13, file: !14, line: 33, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_b", scope: !14, file: !14, line: 30, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!14 = !DIFile(filename: "./divvied-working/purple/example2.c", directory: "/workspaces/build/apps/examples/example2")
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !17, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "divvied-working/purple/example2.c", directory: "/workspaces/build/apps/examples/example2")
!17 = !{!18, !11}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "c", scope: !20, file: !14, line: 24, type: !6, isLocal: true, isDefinition: true)
!20 = distinct !DISubprogram(name: "calc_ewma", scope: !14, file: !14, line: 22, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!21 = !DISubroutineType(types: !22)
!22 = !{!6, !6, !6}
!23 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !DILocation(line: 29, column: 5, scope: !2)
!28 = !DILocation(line: 30, column: 10, scope: !2)
!29 = !DILocation(line: 30, column: 3, scope: !2)
!30 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 35, type: !31, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!31 = !DISubroutineType(types: !32)
!32 = !{!33}
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !DILocalVariable(name: "x", scope: !30, file: !3, line: 36, type: !6)
!35 = !DILocation(line: 36, column: 10, scope: !30)
!36 = !DILocalVariable(name: "y", scope: !30, file: !3, line: 37, type: !6)
!37 = !DILocation(line: 37, column: 10, scope: !30)
!38 = !DILocalVariable(name: "ewma", scope: !30, file: !3, line: 40, type: !6)
!39 = !DILocation(line: 40, column: 10, scope: !30)
!40 = !DILocation(line: 40, column: 3, scope: !30)
!41 = !DILocalVariable(name: "i", scope: !42, file: !3, line: 43, type: !33)
!42 = distinct !DILexicalBlock(scope: !30, file: !3, line: 43, column: 3)
!43 = !DILocation(line: 43, column: 12, scope: !42)
!44 = !DILocation(line: 43, column: 8, scope: !42)
!45 = !DILocation(line: 43, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 43, column: 3)
!47 = !DILocation(line: 43, column: 19, scope: !46)
!48 = !DILocation(line: 43, column: 3, scope: !42)
!49 = !DILocation(line: 44, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 43, column: 30)
!51 = !DILocation(line: 44, column: 7, scope: !50)
!52 = !DILocation(line: 45, column: 21, scope: !50)
!53 = !DILocation(line: 45, column: 12, scope: !50)
!54 = !DILocation(line: 45, column: 10, scope: !50)
!55 = !DILocation(line: 46, column: 19, scope: !50)
!56 = !DILocation(line: 46, column: 5, scope: !50)
!57 = !DILocation(line: 47, column: 3, scope: !50)
!58 = !DILocation(line: 43, column: 26, scope: !46)
!59 = !DILocation(line: 43, column: 3, scope: !46)
!60 = distinct !{!60, !48, !61}
!61 = !DILocation(line: 47, column: 3, scope: !42)
!62 = !DILocation(line: 48, column: 3, scope: !30)
!63 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 51, type: !31, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!64 = !DILocation(line: 52, column: 10, scope: !63)
!65 = !DILocation(line: 52, column: 3, scope: !63)
!66 = distinct !DISubprogram(name: "get_ewma", scope: !14, file: !14, line: 42, type: !67, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!67 = !DISubroutineType(types: !68)
!68 = !{!6, !6}
!69 = !DILocalVariable(name: "x", arg: 1, scope: !66, file: !14, line: 42, type: !6)
!70 = !DILocation(line: 42, column: 24, scope: !66)
!71 = !DILocalVariable(name: "y", scope: !66, file: !14, line: 45, type: !6)
!72 = !DILocation(line: 45, column: 10, scope: !66)
!73 = !DILocation(line: 45, column: 14, scope: !66)
!74 = !DILocation(line: 46, column: 20, scope: !66)
!75 = !DILocation(line: 46, column: 22, scope: !66)
!76 = !DILocation(line: 46, column: 10, scope: !66)
!77 = !DILocation(line: 46, column: 3, scope: !66)
!78 = !DILocation(line: 36, column: 5, scope: !13)
!79 = !DILocation(line: 37, column: 10, scope: !13)
!80 = !DILocation(line: 37, column: 3, scope: !13)
!81 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !14, line: 22, type: !6)
!82 = !DILocation(line: 22, column: 25, scope: !20)
!83 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !14, line: 22, type: !6)
!84 = !DILocation(line: 22, column: 35, scope: !20)
!85 = !DILocalVariable(name: "alpha", scope: !20, file: !14, line: 23, type: !86)
!86 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!87 = !DILocation(line: 23, column: 17, scope: !20)
!88 = !DILocation(line: 25, column: 16, scope: !20)
!89 = !DILocation(line: 25, column: 20, scope: !20)
!90 = !DILocation(line: 25, column: 18, scope: !20)
!91 = !DILocation(line: 25, column: 13, scope: !20)
!92 = !DILocation(line: 25, column: 39, scope: !20)
!93 = !DILocation(line: 25, column: 37, scope: !20)
!94 = !DILocation(line: 25, column: 23, scope: !20)
!95 = !DILocation(line: 25, column: 5, scope: !20)
!96 = !DILocation(line: 26, column: 10, scope: !20)
!97 = !DILocation(line: 26, column: 3, scope: !20)
