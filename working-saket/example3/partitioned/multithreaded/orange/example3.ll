; ModuleID = './partitioned/multithreaded/orange/example3.c'
source_filename = "./partitioned/multithreaded/orange/example3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"EWMA_SHAREABLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [46 x i8] c"./partitioned/multithreaded/orange/example3.c\00", section "llvm.metadata"
@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !11
@.str.2 = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@get_b.b = internal global double 1.000000e+00, align 8, !dbg !16
@.str.3 = private unnamed_addr constant [19 x i8] c"XDLINKAGE_GET_EWMA\00", section "llvm.metadata"
@caller_restarted_get_ewma = common dso_local global i8 0, align 1, !dbg !19
@llvm.global.annotations = appending global [4 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double (double, double)* @calc_ewma to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 28 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 40 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 50 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_ewma to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 60 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !27, metadata !DIExpression()), !dbg !28
  %6 = bitcast double* %3 to i8*
  call void @llvm.var.annotation(i8* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 28)
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !29, metadata !DIExpression()), !dbg !30
  %7 = bitcast double* %4 to i8*
  call void @llvm.var.annotation(i8* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 28)
  call void @llvm.dbg.declare(metadata double* %5, metadata !31, metadata !DIExpression()), !dbg !33
  store double 2.500000e-01, double* %5, align 8, !dbg !33
  %8 = load double, double* %3, align 8, !dbg !34
  %9 = load double, double* %4, align 8, !dbg !35
  %10 = fadd double %8, %9, !dbg !36
  %11 = fmul double 2.500000e-01, %10, !dbg !37
  %12 = load double, double* @calc_ewma.c, align 8, !dbg !38
  %13 = fmul double 7.500000e-01, %12, !dbg !39
  %14 = fadd double %11, %13, !dbg !40
  store double %14, double* @calc_ewma.c, align 8, !dbg !41
  %15 = load double, double* @calc_ewma.c, align 8, !dbg !42
  ret double %15, !dbg !43
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_a() #0 !dbg !13 {
  %1 = load double, double* @get_a.a, align 8, !dbg !44
  %2 = fadd double %1, 1.000000e+00, !dbg !44
  store double %2, double* @get_a.a, align 8, !dbg !44
  %3 = load double, double* @get_a.a, align 8, !dbg !45
  ret double %3, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !18 {
  %1 = load double, double* @get_b.b, align 8, !dbg !47
  %2 = load double, double* @get_b.b, align 8, !dbg !48
  %3 = fadd double %2, %1, !dbg !48
  store double %3, double* @get_b.b, align 8, !dbg !48
  %4 = load double, double* @get_b.b, align 8, !dbg !49
  ret double %4, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_ewma() #0 !dbg !51 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !52, metadata !DIExpression()), !dbg !53
  %3 = call double @get_a(), !dbg !54
  store double %3, double* %1, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata double* %2, metadata !55, metadata !DIExpression()), !dbg !56
  %4 = call double @get_b(), !dbg !57
  store double %4, double* %2, align 8, !dbg !56
  %5 = load double, double* %1, align 8, !dbg !58
  %6 = load double, double* %2, align 8, !dbg !59
  %7 = call double @calc_ewma(double %5, double %6), !dbg !60
  ret double %7, !dbg !61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !62 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !71, metadata !DIExpression()), !dbg !72
  %6 = call i32 (...) @_slave_rpc_loop(), !dbg !73
  ret i32 %6, !dbg !74
}

declare dso_local i32 @_slave_rpc_loop(...) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 32, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 28, type: !4, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./partitioned/multithreaded/orange/example3.c", directory: "/workspaces/build/apps/examples/example3")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "partitioned/multithreaded/orange/example3.c", directory: "/workspaces/build/apps/examples/example3")
!9 = !{}
!10 = !{!0, !11, !16, !19}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "a", scope: !13, file: !3, line: 40, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 37, type: !14, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "b", scope: !18, file: !3, line: 50, type: !6, isLocal: true, isDefinition: true)
!18 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 47, type: !14, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "caller_restarted_get_ewma", scope: !7, file: !21, line: 55, type: !22, isLocal: false, isDefinition: true)
!21 = !DIFile(filename: "./partitioned/multithreaded/orange/orange_rpc.h", directory: "/workspaces/build/apps/examples/example3")
!22 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!23 = !{i32 7, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!27 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 28, type: !6)
!28 = !DILocation(line: 28, column: 25, scope: !2)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 28, type: !6)
!30 = !DILocation(line: 28, column: 35, scope: !2)
!31 = !DILocalVariable(name: "alpha", scope: !2, file: !3, line: 31, type: !32)
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!33 = !DILocation(line: 31, column: 17, scope: !2)
!34 = !DILocation(line: 33, column: 16, scope: !2)
!35 = !DILocation(line: 33, column: 20, scope: !2)
!36 = !DILocation(line: 33, column: 18, scope: !2)
!37 = !DILocation(line: 33, column: 13, scope: !2)
!38 = !DILocation(line: 33, column: 39, scope: !2)
!39 = !DILocation(line: 33, column: 37, scope: !2)
!40 = !DILocation(line: 33, column: 23, scope: !2)
!41 = !DILocation(line: 33, column: 5, scope: !2)
!42 = !DILocation(line: 34, column: 10, scope: !2)
!43 = !DILocation(line: 34, column: 3, scope: !2)
!44 = !DILocation(line: 43, column: 5, scope: !13)
!45 = !DILocation(line: 44, column: 10, scope: !13)
!46 = !DILocation(line: 44, column: 3, scope: !13)
!47 = !DILocation(line: 53, column: 8, scope: !18)
!48 = !DILocation(line: 53, column: 5, scope: !18)
!49 = !DILocation(line: 54, column: 10, scope: !18)
!50 = !DILocation(line: 54, column: 3, scope: !18)
!51 = distinct !DISubprogram(name: "get_ewma", scope: !3, file: !3, line: 60, type: !14, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!52 = !DILocalVariable(name: "x", scope: !51, file: !3, line: 63, type: !6)
!53 = !DILocation(line: 63, column: 10, scope: !51)
!54 = !DILocation(line: 63, column: 14, scope: !51)
!55 = !DILocalVariable(name: "y", scope: !51, file: !3, line: 64, type: !6)
!56 = !DILocation(line: 64, column: 10, scope: !51)
!57 = !DILocation(line: 64, column: 14, scope: !51)
!58 = !DILocation(line: 65, column: 20, scope: !51)
!59 = !DILocation(line: 65, column: 22, scope: !51)
!60 = !DILocation(line: 65, column: 10, scope: !51)
!61 = !DILocation(line: 65, column: 3, scope: !51)
!62 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 73, type: !63, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !3, line: 73, type: !65)
!70 = !DILocation(line: 73, column: 14, scope: !62)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !3, line: 73, type: !66)
!72 = !DILocation(line: 73, column: 26, scope: !62)
!73 = !DILocation(line: 74, column: 10, scope: !62)
!74 = !DILocation(line: 74, column: 3, scope: !62)
