; ModuleID = './partitioned/multithreaded/purple/example1.c'
source_filename = "./partitioned/multithreaded/purple/example1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_b.b = internal global double 1.000000e+00, align 8, !dbg !11
@.str = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [46 x i8] c"./partitioned/multithreaded/purple/example1.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.3 = private unnamed_addr constant [46 x i8] c"./partitioned/multithreaded/purple/example1.c\00", align 1
@__PRETTY_FUNCTION__.ewma_main = private unnamed_addr constant [16 x i8] c"int ewma_main()\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 38 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !20, metadata !DIExpression()), !dbg !21
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata double* %5, metadata !24, metadata !DIExpression()), !dbg !26
  store double 2.500000e-01, double* %5, align 8, !dbg !26
  %6 = load double, double* %3, align 8, !dbg !27
  %7 = load double, double* %4, align 8, !dbg !28
  %8 = fadd double %6, %7, !dbg !29
  %9 = fmul double 2.500000e-01, %8, !dbg !30
  %10 = load double, double* @calc_ewma.c, align 8, !dbg !31
  %11 = fmul double 7.500000e-01, %10, !dbg !32
  %12 = fadd double %9, %11, !dbg !33
  store double %12, double* @calc_ewma.c, align 8, !dbg !34
  %13 = load double, double* @calc_ewma.c, align 8, !dbg !35
  ret double %13, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !13 {
  %1 = load double, double* @get_b.b, align 8, !dbg !37
  %2 = load double, double* @get_b.b, align 8, !dbg !38
  %3 = fadd double %2, %1, !dbg !38
  store double %3, double* @get_b.b, align 8, !dbg !38
  %4 = load double, double* @get_b.b, align 8, !dbg !39
  ret double %4, !dbg !40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !41 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata double* %2, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata double* %3, metadata !49, metadata !DIExpression()), !dbg !50
  %7 = bitcast double* %3 to i8*, !dbg !51
  call void @llvm.var.annotation(i8* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 50), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %4, metadata !52, metadata !DIExpression()), !dbg !54
  store i32 0, i32* %4, align 4, !dbg !54
  br label %8, !dbg !55

8:                                                ; preds = %27, %0
  %9 = load i32, i32* %4, align 4, !dbg !56
  %10 = icmp slt i32 %9, 10, !dbg !58
  br i1 %10, label %11, label %30, !dbg !59

11:                                               ; preds = %8
  call void @llvm.dbg.declare(metadata i32* %5, metadata !60, metadata !DIExpression()), !dbg !62
  store i32 0, i32* %5, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata i32* %6, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 0, i32* %6, align 4, !dbg !64
  %12 = call double (i32*, i32*, ...) bitcast (double (...)* @_rpc_get_a to double (i32*, i32*, ...)*)(i32* %5, i32* %6), !dbg !65
  store double %12, double* %1, align 8, !dbg !66
  %13 = load i32, i32* %5, align 4, !dbg !67
  %14 = icmp eq i32 %13, 1, !dbg !69
  br i1 %14, label %15, label %16, !dbg !70

15:                                               ; preds = %11
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.3, i64 0, i64 0), i32 58, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__PRETTY_FUNCTION__.ewma_main, i64 0, i64 0)) #5, !dbg !71
  unreachable, !dbg !71

16:                                               ; preds = %11
  %17 = load i32, i32* %6, align 4, !dbg !74
  %18 = icmp eq i32 %17, 1, !dbg !76
  br i1 %18, label %19, label %20, !dbg !77

19:                                               ; preds = %16
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.3, i64 0, i64 0), i32 59, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__PRETTY_FUNCTION__.ewma_main, i64 0, i64 0)) #5, !dbg !78
  unreachable, !dbg !78

20:                                               ; preds = %16
  %21 = call double @get_b(), !dbg !81
  store double %21, double* %2, align 8, !dbg !82
  %22 = load double, double* %1, align 8, !dbg !83
  %23 = load double, double* %2, align 8, !dbg !84
  %24 = call double @calc_ewma(double %22, double %23), !dbg !85
  store double %24, double* %3, align 8, !dbg !86
  %25 = load double, double* %3, align 8, !dbg !87
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double %25), !dbg !88
  br label %27, !dbg !89

27:                                               ; preds = %20
  %28 = load i32, i32* %4, align 4, !dbg !90
  %29 = add nsw i32 %28, 1, !dbg !90
  store i32 %29, i32* %4, align 4, !dbg !90
  br label %8, !dbg !91, !llvm.loop !92

30:                                               ; preds = %8
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local double @_rpc_get_a(...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #4

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !95 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !103, metadata !DIExpression()), !dbg !104
  call void (...) @_master_rpc_init(), !dbg !105
  %6 = call i32 @ewma_main(), !dbg !106
  ret i32 %6, !dbg !107
}

declare dso_local void @_master_rpc_init(...) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 29, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 27, type: !4, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./partitioned/multithreaded/purple/example1.c", directory: "/workspaces/build/apps/examples/example1")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "partitioned/multithreaded/purple/example1.c", directory: "/workspaces/build/apps/examples/example1")
!9 = !{}
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "b", scope: !13, file: !3, line: 38, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 35, type: !14, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!20 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 27, type: !6)
!21 = !DILocation(line: 27, column: 25, scope: !2)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 27, type: !6)
!23 = !DILocation(line: 27, column: 35, scope: !2)
!24 = !DILocalVariable(name: "alpha", scope: !2, file: !3, line: 28, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!26 = !DILocation(line: 28, column: 17, scope: !2)
!27 = !DILocation(line: 30, column: 16, scope: !2)
!28 = !DILocation(line: 30, column: 20, scope: !2)
!29 = !DILocation(line: 30, column: 18, scope: !2)
!30 = !DILocation(line: 30, column: 13, scope: !2)
!31 = !DILocation(line: 30, column: 39, scope: !2)
!32 = !DILocation(line: 30, column: 37, scope: !2)
!33 = !DILocation(line: 30, column: 23, scope: !2)
!34 = !DILocation(line: 30, column: 5, scope: !2)
!35 = !DILocation(line: 31, column: 10, scope: !2)
!36 = !DILocation(line: 31, column: 3, scope: !2)
!37 = !DILocation(line: 41, column: 8, scope: !13)
!38 = !DILocation(line: 41, column: 5, scope: !13)
!39 = !DILocation(line: 42, column: 10, scope: !13)
!40 = !DILocation(line: 42, column: 3, scope: !13)
!41 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 45, type: !42, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!42 = !DISubroutineType(types: !43)
!43 = !{!44}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DILocalVariable(name: "x", scope: !41, file: !3, line: 46, type: !6)
!46 = !DILocation(line: 46, column: 10, scope: !41)
!47 = !DILocalVariable(name: "y", scope: !41, file: !3, line: 47, type: !6)
!48 = !DILocation(line: 47, column: 10, scope: !41)
!49 = !DILocalVariable(name: "ewma", scope: !41, file: !3, line: 50, type: !6)
!50 = !DILocation(line: 50, column: 10, scope: !41)
!51 = !DILocation(line: 50, column: 3, scope: !41)
!52 = !DILocalVariable(name: "i", scope: !53, file: !3, line: 53, type: !44)
!53 = distinct !DILexicalBlock(scope: !41, file: !3, line: 53, column: 3)
!54 = !DILocation(line: 53, column: 12, scope: !53)
!55 = !DILocation(line: 53, column: 8, scope: !53)
!56 = !DILocation(line: 53, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !3, line: 53, column: 3)
!58 = !DILocation(line: 53, column: 19, scope: !57)
!59 = !DILocation(line: 53, column: 3, scope: !53)
!60 = !DILocalVariable(name: "error", scope: !61, file: !3, line: 55, type: !44)
!61 = distinct !DILexicalBlock(scope: !57, file: !3, line: 53, column: 30)
!62 = !DILocation(line: 55, column: 9, scope: !61)
!63 = !DILocalVariable(name: "restarted", scope: !61, file: !3, line: 56, type: !44)
!64 = !DILocation(line: 56, column: 9, scope: !61)
!65 = !DILocation(line: 57, column: 9, scope: !61)
!66 = !DILocation(line: 57, column: 7, scope: !61)
!67 = !DILocation(line: 58, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !61, file: !3, line: 58, column: 8)
!69 = !DILocation(line: 58, column: 14, scope: !68)
!70 = !DILocation(line: 58, column: 8, scope: !61)
!71 = !DILocation(line: 58, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !3, line: 58, column: 20)
!73 = distinct !DILexicalBlock(scope: !68, file: !3, line: 58, column: 20)
!74 = !DILocation(line: 59, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !61, file: !3, line: 59, column: 8)
!76 = !DILocation(line: 59, column: 18, scope: !75)
!77 = !DILocation(line: 59, column: 8, scope: !61)
!78 = !DILocation(line: 59, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !3, line: 59, column: 24)
!80 = distinct !DILexicalBlock(scope: !75, file: !3, line: 59, column: 24)
!81 = !DILocation(line: 60, column: 9, scope: !61)
!82 = !DILocation(line: 60, column: 7, scope: !61)
!83 = !DILocation(line: 61, column: 22, scope: !61)
!84 = !DILocation(line: 61, column: 24, scope: !61)
!85 = !DILocation(line: 61, column: 12, scope: !61)
!86 = !DILocation(line: 61, column: 10, scope: !61)
!87 = !DILocation(line: 62, column: 20, scope: !61)
!88 = !DILocation(line: 62, column: 5, scope: !61)
!89 = !DILocation(line: 63, column: 3, scope: !61)
!90 = !DILocation(line: 53, column: 26, scope: !57)
!91 = !DILocation(line: 53, column: 3, scope: !57)
!92 = distinct !{!92, !59, !93}
!93 = !DILocation(line: 63, column: 3, scope: !53)
!94 = !DILocation(line: 64, column: 3, scope: !41)
!95 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 67, type: !96, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!96 = !DISubroutineType(types: !97)
!97 = !{!44, !44, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !3, line: 67, type: !44)
!102 = !DILocation(line: 67, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !3, line: 67, type: !98)
!104 = !DILocation(line: 67, column: 27, scope: !95)
!105 = !DILocation(line: 68, column: 3, scope: !95)
!106 = !DILocation(line: 69, column: 10, scope: !95)
!107 = !DILocation(line: 69, column: 3, scope: !95)
