; ModuleID = './partitioned/multithreaded/purple/example2.c'
source_filename = "./partitioned/multithreaded/purple/example2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_b.b = internal global double 0.000000e+00, align 8, !dbg !11
@.str = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [46 x i8] c"./partitioned/multithreaded/purple/example2.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [19 x i8] c"XDLINKAGE_GET_EWMA\00", section "llvm.metadata"
@llvm.global.annotations = appending global [2 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 34 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double (double)* @get_ewma to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 43 }], section "llvm.metadata"

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
  store double 1.000000e+00, double* %5, align 8, !dbg !26
  %6 = load double, double* %3, align 8, !dbg !27
  %7 = load double, double* %4, align 8, !dbg !28
  %8 = fadd double %6, %7, !dbg !29
  %9 = fmul double 1.000000e+00, %8, !dbg !30
  %10 = load double, double* @calc_ewma.c, align 8, !dbg !31
  %11 = fmul double 0.000000e+00, %10, !dbg !32
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
  %2 = fadd double %1, 1.000000e+00, !dbg !37
  store double %2, double* @get_b.b, align 8, !dbg !37
  %3 = load double, double* @get_b.b, align 8, !dbg !38
  ret double %3, !dbg !39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_ewma(double %0) #0 !dbg !40 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, double* %2, align 8
  call void @llvm.dbg.declare(metadata double* %2, metadata !43, metadata !DIExpression()), !dbg !44
  %4 = bitcast double* %2 to i8*
  call void @llvm.var.annotation(i8* %4, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 43)
  call void @llvm.dbg.declare(metadata double* %3, metadata !45, metadata !DIExpression()), !dbg !46
  %5 = call double @get_b(), !dbg !47
  store double %5, double* %3, align 8, !dbg !46
  %6 = load double, double* %2, align 8, !dbg !48
  %7 = load double, double* %3, align 8, !dbg !49
  %8 = call double @calc_ewma(double %6, double %7), !dbg !50
  ret double %8, !dbg !51
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !52 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !61, metadata !DIExpression()), !dbg !62
  %6 = call i32 (...) @_slave_rpc_loop(), !dbg !63
  ret i32 %6, !dbg !64
}

declare dso_local i32 @_slave_rpc_loop(...) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

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
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "b", scope: !13, file: !3, line: 34, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 31, type: !14, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!20 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 23, type: !6)
!21 = !DILocation(line: 23, column: 25, scope: !2)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 23, type: !6)
!23 = !DILocation(line: 23, column: 35, scope: !2)
!24 = !DILocalVariable(name: "alpha", scope: !2, file: !3, line: 24, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!26 = !DILocation(line: 24, column: 17, scope: !2)
!27 = !DILocation(line: 26, column: 16, scope: !2)
!28 = !DILocation(line: 26, column: 20, scope: !2)
!29 = !DILocation(line: 26, column: 18, scope: !2)
!30 = !DILocation(line: 26, column: 13, scope: !2)
!31 = !DILocation(line: 26, column: 39, scope: !2)
!32 = !DILocation(line: 26, column: 37, scope: !2)
!33 = !DILocation(line: 26, column: 23, scope: !2)
!34 = !DILocation(line: 26, column: 5, scope: !2)
!35 = !DILocation(line: 27, column: 10, scope: !2)
!36 = !DILocation(line: 27, column: 3, scope: !2)
!37 = !DILocation(line: 37, column: 5, scope: !13)
!38 = !DILocation(line: 38, column: 10, scope: !13)
!39 = !DILocation(line: 38, column: 3, scope: !13)
!40 = distinct !DISubprogram(name: "get_ewma", scope: !3, file: !3, line: 43, type: !41, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!41 = !DISubroutineType(types: !42)
!42 = !{!6, !6}
!43 = !DILocalVariable(name: "x", arg: 1, scope: !40, file: !3, line: 43, type: !6)
!44 = !DILocation(line: 43, column: 24, scope: !40)
!45 = !DILocalVariable(name: "y", scope: !40, file: !3, line: 46, type: !6)
!46 = !DILocation(line: 46, column: 10, scope: !40)
!47 = !DILocation(line: 46, column: 14, scope: !40)
!48 = !DILocation(line: 47, column: 20, scope: !40)
!49 = !DILocation(line: 47, column: 22, scope: !40)
!50 = !DILocation(line: 47, column: 10, scope: !40)
!51 = !DILocation(line: 47, column: 3, scope: !40)
!52 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 51, type: !53, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !3, line: 51, type: !55)
!60 = !DILocation(line: 51, column: 14, scope: !52)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !3, line: 51, type: !56)
!62 = !DILocation(line: 51, column: 26, scope: !52)
!63 = !DILocation(line: 52, column: 10, scope: !52)
!64 = !DILocation(line: 52, column: 3, scope: !52)
