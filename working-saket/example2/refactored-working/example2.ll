; ModuleID = './refactored-working/example2.c'
source_filename = "./refactored-working/example2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !11
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./refactored-working/example2.c\00", section "llvm.metadata"
@get_b.b = internal global double 0.000000e+00, align 8, !dbg !16
@.str.2 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [19 x i8] c"XDLINKAGE_GET_EWMA\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@llvm.global.annotations = appending global [3 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 32 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 42 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double (double)* @get_ewma to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 51 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !23, metadata !DIExpression()), !dbg !24
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata double* %5, metadata !27, metadata !DIExpression()), !dbg !29
  store double 1.000000e+00, double* %5, align 8, !dbg !29
  %6 = load double, double* %3, align 8, !dbg !30
  %7 = load double, double* %4, align 8, !dbg !31
  %8 = fadd double %6, %7, !dbg !32
  %9 = fmul double 1.000000e+00, %8, !dbg !33
  %10 = load double, double* @calc_ewma.c, align 8, !dbg !34
  %11 = fmul double 0.000000e+00, %10, !dbg !35
  %12 = fadd double %9, %11, !dbg !36
  store double %12, double* @calc_ewma.c, align 8, !dbg !37
  %13 = load double, double* @calc_ewma.c, align 8, !dbg !38
  ret double %13, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_a() #0 !dbg !13 {
  %1 = load double, double* @get_a.a, align 8, !dbg !40
  %2 = fadd double %1, 1.000000e+00, !dbg !40
  store double %2, double* @get_a.a, align 8, !dbg !40
  %3 = load double, double* @get_a.a, align 8, !dbg !41
  ret double %3, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !18 {
  %1 = load double, double* @get_b.b, align 8, !dbg !43
  %2 = fadd double %1, 1.000000e+00, !dbg !43
  store double %2, double* @get_b.b, align 8, !dbg !43
  %3 = load double, double* @get_b.b, align 8, !dbg !44
  ret double %3, !dbg !45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_ewma(double %0) #0 !dbg !46 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, double* %2, align 8
  call void @llvm.dbg.declare(metadata double* %2, metadata !49, metadata !DIExpression()), !dbg !50
  %4 = bitcast double* %2 to i8*
  call void @llvm.var.annotation(i8* %4, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 51)
  call void @llvm.dbg.declare(metadata double* %3, metadata !51, metadata !DIExpression()), !dbg !52
  %5 = call double @get_b(), !dbg !53
  store double %5, double* %3, align 8, !dbg !52
  %6 = load double, double* %2, align 8, !dbg !54
  %7 = load double, double* %3, align 8, !dbg !55
  %8 = call double @calc_ewma(double %6, double %7), !dbg !56
  ret double %8, !dbg !57
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !58 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata double* %2, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata double* %3, metadata !66, metadata !DIExpression()), !dbg !67
  %5 = bitcast double* %3 to i8*, !dbg !68
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 63), !dbg !68
  call void @llvm.dbg.declare(metadata i32* %4, metadata !69, metadata !DIExpression()), !dbg !71
  store i32 0, i32* %4, align 4, !dbg !71
  br label %6, !dbg !72

6:                                                ; preds = %15, %0
  %7 = load i32, i32* %4, align 4, !dbg !73
  %8 = icmp slt i32 %7, 10, !dbg !75
  br i1 %8, label %9, label %18, !dbg !76

9:                                                ; preds = %6
  %10 = call double @get_a(), !dbg !77
  store double %10, double* %1, align 8, !dbg !79
  %11 = load double, double* %1, align 8, !dbg !80
  %12 = call double @get_ewma(double %11), !dbg !81
  store double %12, double* %3, align 8, !dbg !82
  %13 = load double, double* %3, align 8, !dbg !83
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double %13), !dbg !84
  br label %15, !dbg !85

15:                                               ; preds = %9
  %16 = load i32, i32* %4, align 4, !dbg !86
  %17 = add nsw i32 %16, 1, !dbg !86
  store i32 %17, i32* %4, align 4, !dbg !86
  br label %6, !dbg !87, !llvm.loop !88

18:                                               ; preds = %6
  ret i32 0, !dbg !90
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !91 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = call i32 @ewma_main(), !dbg !92
  ret i32 %2, !dbg !93
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 24, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 22, type: !4, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./refactored-working/example2.c", directory: "/workspaces/build/apps/examples/example2")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "refactored-working/example2.c", directory: "/workspaces/build/apps/examples/example2")
!9 = !{}
!10 = !{!0, !11, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "a", scope: !13, file: !3, line: 32, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 29, type: !14, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "b", scope: !18, file: !3, line: 42, type: !6, isLocal: true, isDefinition: true)
!18 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 39, type: !14, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!23 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 22, type: !6)
!24 = !DILocation(line: 22, column: 25, scope: !2)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 22, type: !6)
!26 = !DILocation(line: 22, column: 35, scope: !2)
!27 = !DILocalVariable(name: "alpha", scope: !2, file: !3, line: 23, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!29 = !DILocation(line: 23, column: 17, scope: !2)
!30 = !DILocation(line: 25, column: 16, scope: !2)
!31 = !DILocation(line: 25, column: 20, scope: !2)
!32 = !DILocation(line: 25, column: 18, scope: !2)
!33 = !DILocation(line: 25, column: 13, scope: !2)
!34 = !DILocation(line: 25, column: 39, scope: !2)
!35 = !DILocation(line: 25, column: 37, scope: !2)
!36 = !DILocation(line: 25, column: 23, scope: !2)
!37 = !DILocation(line: 25, column: 5, scope: !2)
!38 = !DILocation(line: 26, column: 10, scope: !2)
!39 = !DILocation(line: 26, column: 3, scope: !2)
!40 = !DILocation(line: 35, column: 5, scope: !13)
!41 = !DILocation(line: 36, column: 10, scope: !13)
!42 = !DILocation(line: 36, column: 3, scope: !13)
!43 = !DILocation(line: 45, column: 5, scope: !18)
!44 = !DILocation(line: 46, column: 10, scope: !18)
!45 = !DILocation(line: 46, column: 3, scope: !18)
!46 = distinct !DISubprogram(name: "get_ewma", scope: !3, file: !3, line: 51, type: !47, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!47 = !DISubroutineType(types: !48)
!48 = !{!6, !6}
!49 = !DILocalVariable(name: "x", arg: 1, scope: !46, file: !3, line: 51, type: !6)
!50 = !DILocation(line: 51, column: 24, scope: !46)
!51 = !DILocalVariable(name: "y", scope: !46, file: !3, line: 54, type: !6)
!52 = !DILocation(line: 54, column: 10, scope: !46)
!53 = !DILocation(line: 54, column: 14, scope: !46)
!54 = !DILocation(line: 55, column: 20, scope: !46)
!55 = !DILocation(line: 55, column: 22, scope: !46)
!56 = !DILocation(line: 55, column: 10, scope: !46)
!57 = !DILocation(line: 55, column: 3, scope: !46)
!58 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 58, type: !59, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!59 = !DISubroutineType(types: !60)
!60 = !{!61}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DILocalVariable(name: "x", scope: !58, file: !3, line: 59, type: !6)
!63 = !DILocation(line: 59, column: 10, scope: !58)
!64 = !DILocalVariable(name: "y", scope: !58, file: !3, line: 60, type: !6)
!65 = !DILocation(line: 60, column: 10, scope: !58)
!66 = !DILocalVariable(name: "ewma", scope: !58, file: !3, line: 63, type: !6)
!67 = !DILocation(line: 63, column: 10, scope: !58)
!68 = !DILocation(line: 63, column: 3, scope: !58)
!69 = !DILocalVariable(name: "i", scope: !70, file: !3, line: 66, type: !61)
!70 = distinct !DILexicalBlock(scope: !58, file: !3, line: 66, column: 3)
!71 = !DILocation(line: 66, column: 12, scope: !70)
!72 = !DILocation(line: 66, column: 8, scope: !70)
!73 = !DILocation(line: 66, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !3, line: 66, column: 3)
!75 = !DILocation(line: 66, column: 19, scope: !74)
!76 = !DILocation(line: 66, column: 3, scope: !70)
!77 = !DILocation(line: 67, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !3, line: 66, column: 30)
!79 = !DILocation(line: 67, column: 7, scope: !78)
!80 = !DILocation(line: 68, column: 21, scope: !78)
!81 = !DILocation(line: 68, column: 12, scope: !78)
!82 = !DILocation(line: 68, column: 10, scope: !78)
!83 = !DILocation(line: 69, column: 19, scope: !78)
!84 = !DILocation(line: 69, column: 5, scope: !78)
!85 = !DILocation(line: 70, column: 3, scope: !78)
!86 = !DILocation(line: 66, column: 26, scope: !74)
!87 = !DILocation(line: 66, column: 3, scope: !74)
!88 = distinct !{!88, !76, !89}
!89 = !DILocation(line: 70, column: 3, scope: !70)
!90 = !DILocation(line: 71, column: 3, scope: !58)
!91 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 74, type: !59, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!92 = !DILocation(line: 75, column: 10, scope: !91)
!93 = !DILocation(line: 75, column: 3, scope: !91)
