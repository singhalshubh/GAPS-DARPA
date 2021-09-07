; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global.annotations = appending global [5 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double (double, double)* @calc_ewma to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 27 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 39 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 49 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_ewma to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 59 }, { i8*, i8*, i8*, i32 } { i8* bitcast (i32 ()* @ewma_main to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1.2, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2.3, i32 0, i32 0), i32 32 }], section "llvm.metadata"
@.str = private unnamed_addr constant [15 x i8] c"EWMA_SHAREABLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [36 x i8] c"./divvied-working/orange/example3.c\00", section "llvm.metadata"
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !0
@.str.2 = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@get_b.b = internal global double 1.000000e+00, align 8, !dbg !16
@.str.3 = private unnamed_addr constant [19 x i8] c"XDLINKAGE_GET_EWMA\00", section "llvm.metadata"
@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !11
@.str.1.2 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.2.3 = private unnamed_addr constant [36 x i8] c"./divvied-working/purple/example3.c\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !13 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !25, metadata !DIExpression()), !dbg !26
  %6 = bitcast double* %3 to i8*
  call void @llvm.var.annotation(i8* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 27)
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !27, metadata !DIExpression()), !dbg !28
  %7 = bitcast double* %4 to i8*
  call void @llvm.var.annotation(i8* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 27)
  call void @llvm.dbg.declare(metadata double* %5, metadata !29, metadata !DIExpression()), !dbg !31
  store double 2.500000e-01, double* %5, align 8, !dbg !31
  %8 = load double, double* %3, align 8, !dbg !32
  %9 = load double, double* %4, align 8, !dbg !33
  %10 = fadd double %8, %9, !dbg !34
  %11 = fmul double 2.500000e-01, %10, !dbg !35
  %12 = load double, double* @calc_ewma.c, align 8, !dbg !36
  %13 = fmul double 7.500000e-01, %12, !dbg !37
  %14 = fadd double %11, %13, !dbg !38
  store double %14, double* @calc_ewma.c, align 8, !dbg !39
  %15 = load double, double* @calc_ewma.c, align 8, !dbg !40
  ret double %15, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_ewma() #0 !dbg !42 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !43, metadata !DIExpression()), !dbg !44
  %3 = call double @get_a() #4, !dbg !45
  store double %3, double* %1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata double* %2, metadata !46, metadata !DIExpression()), !dbg !47
  %4 = call double @get_b() #4, !dbg !48
  store double %4, double* %2, align 8, !dbg !47
  %5 = load double, double* %1, align 8, !dbg !49
  %6 = load double, double* %2, align 8, !dbg !50
  %7 = call double @calc_ewma(double %5, double %6) #4, !dbg !51
  ret double %7, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_a() #0 !dbg !2 {
  %1 = load double, double* @get_a.a, align 8, !dbg !53
  %2 = fadd double %1, 1.000000e+00, !dbg !53
  store double %2, double* @get_a.a, align 8, !dbg !53
  %3 = load double, double* @get_a.a, align 8, !dbg !54
  ret double %3, !dbg !55
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !18 {
  %1 = load double, double* @get_b.b, align 8, !dbg !56
  %2 = load double, double* @get_b.b, align 8, !dbg !57
  %3 = fadd double %2, %1, !dbg !57
  store double %3, double* @get_b.b, align 8, !dbg !57
  %4 = load double, double* @get_b.b, align 8, !dbg !58
  ret double %4, !dbg !59
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !60 {
  %1 = alloca double, align 8
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32* %2, metadata !67, metadata !DIExpression()), !dbg !69
  store i32 0, i32* %2, align 4, !dbg !69
  br label %3, !dbg !70

3:                                                ; preds = %11, %0
  %4 = load i32, i32* %2, align 4, !dbg !71
  %5 = icmp slt i32 %4, 10, !dbg !73
  br i1 %5, label %6, label %14, !dbg !74

6:                                                ; preds = %3
  %7 = call i32 (...) bitcast (double ()* @get_ewma to i32 (...)*)() #4, !dbg !75
  %8 = sitofp i32 %7 to double, !dbg !75
  store double %8, double* %1, align 8, !dbg !77
  %9 = load double, double* %1, align 8, !dbg !78
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double %9) #4, !dbg !79
  br label %11, !dbg !80

11:                                               ; preds = %6
  %12 = load i32, i32* %2, align 4, !dbg !81
  %13 = add nsw i32 %12, 1, !dbg !81
  store i32 %13, i32* %2, align 4, !dbg !81
  br label %3, !dbg !82, !llvm.loop !83

14:                                               ; preds = %3
  ret i32 0, !dbg !85
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !86 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !94, metadata !DIExpression()), !dbg !95
  %6 = call i32 @ewma_main() #4, !dbg !96
  ret i32 %6, !dbg !97
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!7, !19}
!llvm.ident = !{!21, !21}
!llvm.module.flags = !{!22, !23, !24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 39, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 36, type: !4, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./divvied-working/orange/example3.c", directory: "/workspaces/build/apps/examples/example3")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "divvied-working/orange/example3.c", directory: "/workspaces/build/apps/examples/example3")
!9 = !{}
!10 = !{!11, !0, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "c", scope: !13, file: !3, line: 31, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 27, type: !14, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6, !6, !6}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "b", scope: !18, file: !3, line: 49, type: !6, isLocal: true, isDefinition: true)
!18 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 46, type: !4, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "divvied-working/purple/example3.c", directory: "/workspaces/build/apps/examples/example3")
!21 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !3, line: 27, type: !6)
!26 = !DILocation(line: 27, column: 25, scope: !13)
!27 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !3, line: 27, type: !6)
!28 = !DILocation(line: 27, column: 35, scope: !13)
!29 = !DILocalVariable(name: "alpha", scope: !13, file: !3, line: 30, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!31 = !DILocation(line: 30, column: 17, scope: !13)
!32 = !DILocation(line: 32, column: 16, scope: !13)
!33 = !DILocation(line: 32, column: 20, scope: !13)
!34 = !DILocation(line: 32, column: 18, scope: !13)
!35 = !DILocation(line: 32, column: 13, scope: !13)
!36 = !DILocation(line: 32, column: 39, scope: !13)
!37 = !DILocation(line: 32, column: 37, scope: !13)
!38 = !DILocation(line: 32, column: 23, scope: !13)
!39 = !DILocation(line: 32, column: 5, scope: !13)
!40 = !DILocation(line: 33, column: 10, scope: !13)
!41 = !DILocation(line: 33, column: 3, scope: !13)
!42 = distinct !DISubprogram(name: "get_ewma", scope: !3, file: !3, line: 59, type: !4, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!43 = !DILocalVariable(name: "x", scope: !42, file: !3, line: 62, type: !6)
!44 = !DILocation(line: 62, column: 10, scope: !42)
!45 = !DILocation(line: 62, column: 14, scope: !42)
!46 = !DILocalVariable(name: "y", scope: !42, file: !3, line: 63, type: !6)
!47 = !DILocation(line: 63, column: 10, scope: !42)
!48 = !DILocation(line: 63, column: 14, scope: !42)
!49 = !DILocation(line: 64, column: 20, scope: !42)
!50 = !DILocation(line: 64, column: 22, scope: !42)
!51 = !DILocation(line: 64, column: 10, scope: !42)
!52 = !DILocation(line: 64, column: 3, scope: !42)
!53 = !DILocation(line: 42, column: 5, scope: !2)
!54 = !DILocation(line: 43, column: 10, scope: !2)
!55 = !DILocation(line: 43, column: 3, scope: !2)
!56 = !DILocation(line: 52, column: 8, scope: !18)
!57 = !DILocation(line: 52, column: 5, scope: !18)
!58 = !DILocation(line: 53, column: 10, scope: !18)
!59 = !DILocation(line: 53, column: 3, scope: !18)
!60 = distinct !DISubprogram(name: "ewma_main", scope: !61, file: !61, line: 32, type: !62, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !9)
!61 = !DIFile(filename: "./divvied-working/purple/example3.c", directory: "/workspaces/build/apps/examples/example3")
!62 = !DISubroutineType(types: !63)
!63 = !{!64}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DILocalVariable(name: "ewma", scope: !60, file: !61, line: 35, type: !6)
!66 = !DILocation(line: 35, column: 10, scope: !60)
!67 = !DILocalVariable(name: "i", scope: !68, file: !61, line: 36, type: !64)
!68 = distinct !DILexicalBlock(scope: !60, file: !61, line: 36, column: 3)
!69 = !DILocation(line: 36, column: 12, scope: !68)
!70 = !DILocation(line: 36, column: 8, scope: !68)
!71 = !DILocation(line: 36, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !61, line: 36, column: 3)
!73 = !DILocation(line: 36, column: 19, scope: !72)
!74 = !DILocation(line: 36, column: 3, scope: !68)
!75 = !DILocation(line: 37, column: 12, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !61, line: 36, column: 30)
!77 = !DILocation(line: 37, column: 10, scope: !76)
!78 = !DILocation(line: 38, column: 20, scope: !76)
!79 = !DILocation(line: 38, column: 5, scope: !76)
!80 = !DILocation(line: 39, column: 3, scope: !76)
!81 = !DILocation(line: 36, column: 26, scope: !72)
!82 = !DILocation(line: 36, column: 3, scope: !72)
!83 = distinct !{!83, !74, !84}
!84 = !DILocation(line: 39, column: 3, scope: !68)
!85 = !DILocation(line: 40, column: 3, scope: !60)
!86 = distinct !DISubprogram(name: "main", scope: !61, file: !61, line: 43, type: !87, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !9)
!87 = !DISubroutineType(types: !88)
!88 = !{!64, !64, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !61, line: 43, type: !64)
!93 = !DILocation(line: 43, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !61, line: 43, type: !89)
!95 = !DILocation(line: 43, column: 27, scope: !86)
!96 = !DILocation(line: 44, column: 10, scope: !86)
!97 = !DILocation(line: 44, column: 3, scope: !86)
