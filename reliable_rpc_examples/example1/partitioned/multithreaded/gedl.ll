; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global.annotations = appending global [3 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 34 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_a to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 29 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1.4, i32 0, i32 0), i32 37 }], section "llvm.metadata"
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !0
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./divvied/orange/example1.mod.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [16 x i8] c"XDLINKAGE_GET_A\00", section "llvm.metadata"
@get_b.b = internal global double 1.000000e+00, align 8, !dbg !11
@.str.3 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [32 x i8] c"./divvied/purple/example1.mod.c\00", section "llvm.metadata"
@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !18
@.str.2.5 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_a() #0 !dbg !2 {
  %1 = load double, double* @get_a.a, align 8, !dbg !27
  %2 = fadd double %1, 1.000000e+00, !dbg !27
  store double %2, double* @get_a.a, align 8, !dbg !27
  %3 = load double, double* @get_a.a, align 8, !dbg !28
  ret double %3, !dbg !29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !20 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !30, metadata !DIExpression()), !dbg !31
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata double* %5, metadata !34, metadata !DIExpression()), !dbg !36
  store double 2.500000e-01, double* %5, align 8, !dbg !36
  %6 = load double, double* %3, align 8, !dbg !37
  %7 = load double, double* %4, align 8, !dbg !38
  %8 = fadd double %6, %7, !dbg !39
  %9 = fmul double 2.500000e-01, %8, !dbg !40
  %10 = load double, double* @calc_ewma.c, align 8, !dbg !41
  %11 = fmul double 7.500000e-01, %10, !dbg !42
  %12 = fadd double %9, %11, !dbg !43
  store double %12, double* @calc_ewma.c, align 8, !dbg !44
  %13 = load double, double* @calc_ewma.c, align 8, !dbg !45
  ret double %13, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !13 {
  %1 = load double, double* @get_b.b, align 8, !dbg !47
  %2 = load double, double* @get_b.b, align 8, !dbg !48
  %3 = fadd double %2, %1, !dbg !48
  store double %3, double* @get_b.b, align 8, !dbg !48
  %4 = load double, double* @get_b.b, align 8, !dbg !49
  ret double %4, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !51 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata double* %2, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata double* %3, metadata !59, metadata !DIExpression()), !dbg !60
  %5 = bitcast double* %3 to i8*, !dbg !61
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1.4, i32 0, i32 0), i32 49), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %4, metadata !62, metadata !DIExpression()), !dbg !64
  store i32 0, i32* %4, align 4, !dbg !64
  br label %6, !dbg !65

6:                                                ; preds = %18, %0
  %7 = load i32, i32* %4, align 4, !dbg !66
  %8 = icmp slt i32 %7, 10, !dbg !68
  br i1 %8, label %9, label %21, !dbg !69

9:                                                ; preds = %6
  %10 = call i32 (...) bitcast (double ()* @get_a to i32 (...)*)(), !dbg !70
  %11 = sitofp i32 %10 to double, !dbg !70
  store double %11, double* %1, align 8, !dbg !72
  %12 = call double @get_b(), !dbg !73
  store double %12, double* %2, align 8, !dbg !74
  %13 = load double, double* %1, align 8, !dbg !75
  %14 = load double, double* %2, align 8, !dbg !76
  %15 = call double @calc_ewma(double %13, double %14), !dbg !77
  store double %15, double* %3, align 8, !dbg !78
  %16 = load double, double* %3, align 8, !dbg !79
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2.5, i64 0, i64 0), double %16), !dbg !80
  br label %18, !dbg !81

18:                                               ; preds = %9
  %19 = load i32, i32* %4, align 4, !dbg !82
  %20 = add nsw i32 %19, 1, !dbg !82
  store i32 %20, i32* %4, align 4, !dbg !82
  br label %6, !dbg !83, !llvm.loop !84

21:                                               ; preds = %6
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !87 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !95, metadata !DIExpression()), !dbg !96
  %6 = call i32 @ewma_main(), !dbg !97
  ret i32 %6, !dbg !98
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7, !15}
!llvm.ident = !{!23, !23}
!llvm.module.flags = !{!24, !25, !26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 34, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 29, type: !4, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./divvied/orange/example1.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example1")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "divvied/orange/example1.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example1")
!9 = !{}
!10 = !{!0}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "b", scope: !13, file: !14, line: 37, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_b", scope: !14, file: !14, line: 34, type: !4, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!14 = !DIFile(filename: "./divvied/purple/example1.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example1")
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !17, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "divvied/purple/example1.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example1")
!17 = !{!18, !11}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "c", scope: !20, file: !14, line: 28, type: !6, isLocal: true, isDefinition: true)
!20 = distinct !DISubprogram(name: "calc_ewma", scope: !14, file: !14, line: 26, type: !21, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!21 = !DISubroutineType(types: !22)
!22 = !{!6, !6, !6}
!23 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)"}
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !DILocation(line: 37, column: 5, scope: !2)
!28 = !DILocation(line: 38, column: 10, scope: !2)
!29 = !DILocation(line: 38, column: 3, scope: !2)
!30 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !14, line: 26, type: !6)
!31 = !DILocation(line: 26, column: 25, scope: !20)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !14, line: 26, type: !6)
!33 = !DILocation(line: 26, column: 35, scope: !20)
!34 = !DILocalVariable(name: "alpha", scope: !20, file: !14, line: 27, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!36 = !DILocation(line: 27, column: 17, scope: !20)
!37 = !DILocation(line: 29, column: 16, scope: !20)
!38 = !DILocation(line: 29, column: 20, scope: !20)
!39 = !DILocation(line: 29, column: 18, scope: !20)
!40 = !DILocation(line: 29, column: 13, scope: !20)
!41 = !DILocation(line: 29, column: 39, scope: !20)
!42 = !DILocation(line: 29, column: 37, scope: !20)
!43 = !DILocation(line: 29, column: 23, scope: !20)
!44 = !DILocation(line: 29, column: 5, scope: !20)
!45 = !DILocation(line: 30, column: 10, scope: !20)
!46 = !DILocation(line: 30, column: 3, scope: !20)
!47 = !DILocation(line: 40, column: 8, scope: !13)
!48 = !DILocation(line: 40, column: 5, scope: !13)
!49 = !DILocation(line: 41, column: 10, scope: !13)
!50 = !DILocation(line: 41, column: 3, scope: !13)
!51 = distinct !DISubprogram(name: "ewma_main", scope: !14, file: !14, line: 44, type: !52, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!52 = !DISubroutineType(types: !53)
!53 = !{!54}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DILocalVariable(name: "x", scope: !51, file: !14, line: 45, type: !6)
!56 = !DILocation(line: 45, column: 10, scope: !51)
!57 = !DILocalVariable(name: "y", scope: !51, file: !14, line: 46, type: !6)
!58 = !DILocation(line: 46, column: 10, scope: !51)
!59 = !DILocalVariable(name: "ewma", scope: !51, file: !14, line: 49, type: !6)
!60 = !DILocation(line: 49, column: 10, scope: !51)
!61 = !DILocation(line: 49, column: 3, scope: !51)
!62 = !DILocalVariable(name: "i", scope: !63, file: !14, line: 52, type: !54)
!63 = distinct !DILexicalBlock(scope: !51, file: !14, line: 52, column: 3)
!64 = !DILocation(line: 52, column: 12, scope: !63)
!65 = !DILocation(line: 52, column: 8, scope: !63)
!66 = !DILocation(line: 52, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !14, line: 52, column: 3)
!68 = !DILocation(line: 52, column: 19, scope: !67)
!69 = !DILocation(line: 52, column: 3, scope: !63)
!70 = !DILocation(line: 53, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !14, line: 52, column: 30)
!72 = !DILocation(line: 53, column: 7, scope: !71)
!73 = !DILocation(line: 54, column: 9, scope: !71)
!74 = !DILocation(line: 54, column: 7, scope: !71)
!75 = !DILocation(line: 55, column: 22, scope: !71)
!76 = !DILocation(line: 55, column: 24, scope: !71)
!77 = !DILocation(line: 55, column: 12, scope: !71)
!78 = !DILocation(line: 55, column: 10, scope: !71)
!79 = !DILocation(line: 56, column: 20, scope: !71)
!80 = !DILocation(line: 56, column: 5, scope: !71)
!81 = !DILocation(line: 57, column: 3, scope: !71)
!82 = !DILocation(line: 52, column: 26, scope: !67)
!83 = !DILocation(line: 52, column: 3, scope: !67)
!84 = distinct !{!84, !69, !85}
!85 = !DILocation(line: 57, column: 3, scope: !63)
!86 = !DILocation(line: 58, column: 3, scope: !51)
!87 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 61, type: !88, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!88 = !DISubroutineType(types: !89)
!89 = !{!54, !54, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !14, line: 61, type: !54)
!94 = !DILocation(line: 61, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !14, line: 61, type: !90)
!96 = !DILocation(line: 61, column: 27, scope: !87)
!97 = !DILocation(line: 62, column: 10, scope: !87)
!98 = !DILocation(line: 62, column: 3, scope: !87)
