; ModuleID = './partitioned/multithreaded/purple/example2.c'
source_filename = "./partitioned/multithreaded/purple/example2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_b.b = internal global double 1.000000e+00, align 8, !dbg !11
@.str = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [46 x i8] c"./partitioned/multithreaded/purple/example2.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [19 x i8] c"XDLINKAGE_GET_EWMA\00", section "llvm.metadata"
@caller_restarted_get_ewma = common dso_local global i8 0, align 1, !dbg !16
@llvm.global.annotations = appending global [2 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 34 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double (double)* @get_ewma to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 43 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !24, metadata !DIExpression()), !dbg !25
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata double* %5, metadata !28, metadata !DIExpression()), !dbg !30
  store double 2.500000e-01, double* %5, align 8, !dbg !30
  %6 = load double, double* %3, align 8, !dbg !31
  %7 = load double, double* %4, align 8, !dbg !32
  %8 = fadd double %6, %7, !dbg !33
  %9 = fmul double 2.500000e-01, %8, !dbg !34
  %10 = load double, double* @calc_ewma.c, align 8, !dbg !35
  %11 = fmul double 7.500000e-01, %10, !dbg !36
  %12 = fadd double %9, %11, !dbg !37
  store double %12, double* @calc_ewma.c, align 8, !dbg !38
  %13 = load double, double* @calc_ewma.c, align 8, !dbg !39
  ret double %13, !dbg !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !13 {
  %1 = load double, double* @get_b.b, align 8, !dbg !41
  %2 = load double, double* @get_b.b, align 8, !dbg !42
  %3 = fadd double %2, %1, !dbg !42
  store double %3, double* @get_b.b, align 8, !dbg !42
  %4 = load double, double* @get_b.b, align 8, !dbg !43
  ret double %4, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_ewma(double %0) #0 !dbg !45 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, double* %2, align 8
  call void @llvm.dbg.declare(metadata double* %2, metadata !48, metadata !DIExpression()), !dbg !49
  %4 = bitcast double* %2 to i8*
  call void @llvm.var.annotation(i8* %4, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 43)
  call void @llvm.dbg.declare(metadata double* %3, metadata !50, metadata !DIExpression()), !dbg !51
  %5 = call double @get_b(), !dbg !52
  store double %5, double* %3, align 8, !dbg !51
  %6 = load double, double* %2, align 8, !dbg !53
  %7 = load double, double* %3, align 8, !dbg !54
  %8 = call double @calc_ewma(double %6, double %7), !dbg !55
  ret double %8, !dbg !56
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !57 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !66, metadata !DIExpression()), !dbg !67
  %6 = call i32 (...) @_slave_rpc_loop(), !dbg !68
  ret i32 %6, !dbg !69
}

declare dso_local i32 @_slave_rpc_loop(...) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 25, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 23, type: !4, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./partitioned/multithreaded/purple/example2.c", directory: "/workspaces/build/apps/examples/example2")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "partitioned/multithreaded/purple/example2.c", directory: "/workspaces/build/apps/examples/example2")
!9 = !{}
!10 = !{!0, !11, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "b", scope: !13, file: !3, line: 34, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 31, type: !14, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "caller_restarted_get_ewma", scope: !7, file: !18, line: 55, type: !19, isLocal: false, isDefinition: true)
!18 = !DIFile(filename: "./partitioned/multithreaded/purple/purple_rpc.h", directory: "/workspaces/build/apps/examples/example2")
!19 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!24 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 23, type: !6)
!25 = !DILocation(line: 23, column: 25, scope: !2)
!26 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 23, type: !6)
!27 = !DILocation(line: 23, column: 35, scope: !2)
!28 = !DILocalVariable(name: "alpha", scope: !2, file: !3, line: 24, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!30 = !DILocation(line: 24, column: 17, scope: !2)
!31 = !DILocation(line: 26, column: 16, scope: !2)
!32 = !DILocation(line: 26, column: 20, scope: !2)
!33 = !DILocation(line: 26, column: 18, scope: !2)
!34 = !DILocation(line: 26, column: 13, scope: !2)
!35 = !DILocation(line: 26, column: 39, scope: !2)
!36 = !DILocation(line: 26, column: 37, scope: !2)
!37 = !DILocation(line: 26, column: 23, scope: !2)
!38 = !DILocation(line: 26, column: 5, scope: !2)
!39 = !DILocation(line: 27, column: 10, scope: !2)
!40 = !DILocation(line: 27, column: 3, scope: !2)
!41 = !DILocation(line: 37, column: 8, scope: !13)
!42 = !DILocation(line: 37, column: 5, scope: !13)
!43 = !DILocation(line: 38, column: 10, scope: !13)
!44 = !DILocation(line: 38, column: 3, scope: !13)
!45 = distinct !DISubprogram(name: "get_ewma", scope: !3, file: !3, line: 43, type: !46, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!46 = !DISubroutineType(types: !47)
!47 = !{!6, !6}
!48 = !DILocalVariable(name: "x", arg: 1, scope: !45, file: !3, line: 43, type: !6)
!49 = !DILocation(line: 43, column: 24, scope: !45)
!50 = !DILocalVariable(name: "y", scope: !45, file: !3, line: 46, type: !6)
!51 = !DILocation(line: 46, column: 10, scope: !45)
!52 = !DILocation(line: 46, column: 14, scope: !45)
!53 = !DILocation(line: 47, column: 20, scope: !45)
!54 = !DILocation(line: 47, column: 22, scope: !45)
!55 = !DILocation(line: 47, column: 10, scope: !45)
!56 = !DILocation(line: 47, column: 3, scope: !45)
!57 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 51, type: !58, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !3, line: 51, type: !60)
!65 = !DILocation(line: 51, column: 14, scope: !57)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !3, line: 51, type: !61)
!67 = !DILocation(line: 51, column: 26, scope: !57)
!68 = !DILocation(line: 52, column: 10, scope: !57)
!69 = !DILocation(line: 52, column: 3, scope: !57)
