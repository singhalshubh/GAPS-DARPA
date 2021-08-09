; ModuleID = './refactored-working/example2.c'
source_filename = "./refactored-working/example2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !11
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./refactored-working/example2.c\00", section "llvm.metadata"
@get_b.b = internal global double 1.000000e+00, align 8, !dbg !16
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
  store double 2.500000e-01, double* %5, align 8, !dbg !29
  %6 = load double, double* %3, align 8, !dbg !30
  %7 = load double, double* %4, align 8, !dbg !31
  %8 = fadd double %6, %7, !dbg !32
  %9 = fmul double 2.500000e-01, %8, !dbg !33
  %10 = load double, double* @calc_ewma.c, align 8, !dbg !34
  %11 = fmul double 7.500000e-01, %10, !dbg !35
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
  %2 = load double, double* @get_b.b, align 8, !dbg !44
  %3 = fadd double %2, %1, !dbg !44
  store double %3, double* @get_b.b, align 8, !dbg !44
  %4 = load double, double* @get_b.b, align 8, !dbg !45
  ret double %4, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_ewma(double %0) #0 !dbg !47 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, double* %2, align 8
  call void @llvm.dbg.declare(metadata double* %2, metadata !50, metadata !DIExpression()), !dbg !51
  %4 = bitcast double* %2 to i8*
  call void @llvm.var.annotation(i8* %4, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 51)
  call void @llvm.dbg.declare(metadata double* %3, metadata !52, metadata !DIExpression()), !dbg !53
  %5 = call double @get_b(), !dbg !54
  store double %5, double* %3, align 8, !dbg !53
  %6 = load double, double* %2, align 8, !dbg !55
  %7 = load double, double* %3, align 8, !dbg !56
  %8 = call double @calc_ewma(double %6, double %7), !dbg !57
  ret double %8, !dbg !58
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !59 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata double* %2, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata double* %3, metadata !67, metadata !DIExpression()), !dbg !68
  %5 = bitcast double* %3 to i8*, !dbg !69
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 63), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %4, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 0, i32* %4, align 4, !dbg !72
  br label %6, !dbg !73

6:                                                ; preds = %15, %0
  %7 = load i32, i32* %4, align 4, !dbg !74
  %8 = icmp slt i32 %7, 10, !dbg !76
  br i1 %8, label %9, label %18, !dbg !77

9:                                                ; preds = %6
  %10 = call double @get_a(), !dbg !78
  store double %10, double* %1, align 8, !dbg !80
  %11 = load double, double* %1, align 8, !dbg !81
  %12 = call double @get_ewma(double %11), !dbg !82
  store double %12, double* %3, align 8, !dbg !83
  %13 = load double, double* %3, align 8, !dbg !84
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double %13), !dbg !85
  br label %15, !dbg !86

15:                                               ; preds = %9
  %16 = load i32, i32* %4, align 4, !dbg !87
  %17 = add nsw i32 %16, 1, !dbg !87
  store i32 %17, i32* %4, align 4, !dbg !87
  br label %6, !dbg !88, !llvm.loop !89

18:                                               ; preds = %6
  ret i32 0, !dbg !91
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !92 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = call i32 @ewma_main(), !dbg !93
  ret i32 %2, !dbg !94
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
!43 = !DILocation(line: 45, column: 8, scope: !18)
!44 = !DILocation(line: 45, column: 5, scope: !18)
!45 = !DILocation(line: 46, column: 10, scope: !18)
!46 = !DILocation(line: 46, column: 3, scope: !18)
!47 = distinct !DISubprogram(name: "get_ewma", scope: !3, file: !3, line: 51, type: !48, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!48 = !DISubroutineType(types: !49)
!49 = !{!6, !6}
!50 = !DILocalVariable(name: "x", arg: 1, scope: !47, file: !3, line: 51, type: !6)
!51 = !DILocation(line: 51, column: 24, scope: !47)
!52 = !DILocalVariable(name: "y", scope: !47, file: !3, line: 54, type: !6)
!53 = !DILocation(line: 54, column: 10, scope: !47)
!54 = !DILocation(line: 54, column: 14, scope: !47)
!55 = !DILocation(line: 55, column: 20, scope: !47)
!56 = !DILocation(line: 55, column: 22, scope: !47)
!57 = !DILocation(line: 55, column: 10, scope: !47)
!58 = !DILocation(line: 55, column: 3, scope: !47)
!59 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 58, type: !60, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!60 = !DISubroutineType(types: !61)
!61 = !{!62}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DILocalVariable(name: "x", scope: !59, file: !3, line: 59, type: !6)
!64 = !DILocation(line: 59, column: 10, scope: !59)
!65 = !DILocalVariable(name: "y", scope: !59, file: !3, line: 60, type: !6)
!66 = !DILocation(line: 60, column: 10, scope: !59)
!67 = !DILocalVariable(name: "ewma", scope: !59, file: !3, line: 63, type: !6)
!68 = !DILocation(line: 63, column: 10, scope: !59)
!69 = !DILocation(line: 63, column: 3, scope: !59)
!70 = !DILocalVariable(name: "i", scope: !71, file: !3, line: 66, type: !62)
!71 = distinct !DILexicalBlock(scope: !59, file: !3, line: 66, column: 3)
!72 = !DILocation(line: 66, column: 12, scope: !71)
!73 = !DILocation(line: 66, column: 8, scope: !71)
!74 = !DILocation(line: 66, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !3, line: 66, column: 3)
!76 = !DILocation(line: 66, column: 19, scope: !75)
!77 = !DILocation(line: 66, column: 3, scope: !71)
!78 = !DILocation(line: 67, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 66, column: 30)
!80 = !DILocation(line: 67, column: 7, scope: !79)
!81 = !DILocation(line: 68, column: 21, scope: !79)
!82 = !DILocation(line: 68, column: 12, scope: !79)
!83 = !DILocation(line: 68, column: 10, scope: !79)
!84 = !DILocation(line: 69, column: 20, scope: !79)
!85 = !DILocation(line: 69, column: 5, scope: !79)
!86 = !DILocation(line: 70, column: 3, scope: !79)
!87 = !DILocation(line: 66, column: 26, scope: !75)
!88 = !DILocation(line: 66, column: 3, scope: !75)
!89 = distinct !{!89, !77, !90}
!90 = !DILocation(line: 70, column: 3, scope: !71)
!91 = !DILocation(line: 71, column: 3, scope: !59)
!92 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 74, type: !60, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!93 = !DILocation(line: 75, column: 10, scope: !92)
!94 = !DILocation(line: 75, column: 3, scope: !92)
