; ModuleID = './refactored-working/example3.c'
source_filename = "./refactored-working/example3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"EWMA_SHAREABLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./refactored-working/example3.c\00", section "llvm.metadata"
@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !11
@.str.2 = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@get_b.b = internal global double 1.000000e+00, align 8, !dbg !16
@.str.3 = private unnamed_addr constant [19 x i8] c"XDLINKAGE_GET_EWMA\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@llvm.global.annotations = appending global [5 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double (double, double)* @calc_ewma to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 27 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 39 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 49 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_ewma to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 59 }, { i8*, i8*, i8*, i32 } { i8* bitcast (i32 ()* @ewma_main to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 69 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !23, metadata !DIExpression()), !dbg !24
  %6 = bitcast double* %3 to i8*
  call void @llvm.var.annotation(i8* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 27)
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !25, metadata !DIExpression()), !dbg !26
  %7 = bitcast double* %4 to i8*
  call void @llvm.var.annotation(i8* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 27)
  call void @llvm.dbg.declare(metadata double* %5, metadata !27, metadata !DIExpression()), !dbg !29
  store double 2.500000e-01, double* %5, align 8, !dbg !29
  %8 = load double, double* %3, align 8, !dbg !30
  %9 = load double, double* %4, align 8, !dbg !31
  %10 = fadd double %8, %9, !dbg !32
  %11 = fmul double 2.500000e-01, %10, !dbg !33
  %12 = load double, double* @calc_ewma.c, align 8, !dbg !34
  %13 = fmul double 7.500000e-01, %12, !dbg !35
  %14 = fadd double %11, %13, !dbg !36
  store double %14, double* @calc_ewma.c, align 8, !dbg !37
  %15 = load double, double* @calc_ewma.c, align 8, !dbg !38
  ret double %15, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

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
define dso_local double @get_ewma() #0 !dbg !47 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !48, metadata !DIExpression()), !dbg !49
  %3 = call double @get_a(), !dbg !50
  store double %3, double* %1, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata double* %2, metadata !51, metadata !DIExpression()), !dbg !52
  %4 = call double @get_b(), !dbg !53
  store double %4, double* %2, align 8, !dbg !52
  %5 = load double, double* %1, align 8, !dbg !54
  %6 = load double, double* %2, align 8, !dbg !55
  %7 = call double @calc_ewma(double %5, double %6), !dbg !56
  ret double %7, !dbg !57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !58 {
  %1 = alloca double, align 8
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %2, metadata !64, metadata !DIExpression()), !dbg !66
  store i32 0, i32* %2, align 4, !dbg !66
  br label %3, !dbg !67

3:                                                ; preds = %10, %0
  %4 = load i32, i32* %2, align 4, !dbg !68
  %5 = icmp slt i32 %4, 10, !dbg !70
  br i1 %5, label %6, label %13, !dbg !71

6:                                                ; preds = %3
  %7 = call double @get_ewma(), !dbg !72
  store double %7, double* %1, align 8, !dbg !74
  %8 = load double, double* %1, align 8, !dbg !75
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double %8), !dbg !76
  br label %10, !dbg !77

10:                                               ; preds = %6
  %11 = load i32, i32* %2, align 4, !dbg !78
  %12 = add nsw i32 %11, 1, !dbg !78
  store i32 %12, i32* %2, align 4, !dbg !78
  br label %3, !dbg !79, !llvm.loop !80

13:                                               ; preds = %3
  ret i32 0, !dbg !82
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !83 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !91, metadata !DIExpression()), !dbg !92
  %6 = call i32 @ewma_main(), !dbg !93
  ret i32 %6, !dbg !94
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 31, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 27, type: !4, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./refactored-working/example3.c", directory: "/workspaces/build/apps/examples/example3")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "refactored-working/example3.c", directory: "/workspaces/build/apps/examples/example3")
!9 = !{}
!10 = !{!0, !11, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "a", scope: !13, file: !3, line: 39, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 36, type: !14, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "b", scope: !18, file: !3, line: 49, type: !6, isLocal: true, isDefinition: true)
!18 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 46, type: !14, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!23 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 27, type: !6)
!24 = !DILocation(line: 27, column: 25, scope: !2)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 27, type: !6)
!26 = !DILocation(line: 27, column: 35, scope: !2)
!27 = !DILocalVariable(name: "alpha", scope: !2, file: !3, line: 30, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!29 = !DILocation(line: 30, column: 17, scope: !2)
!30 = !DILocation(line: 32, column: 16, scope: !2)
!31 = !DILocation(line: 32, column: 20, scope: !2)
!32 = !DILocation(line: 32, column: 18, scope: !2)
!33 = !DILocation(line: 32, column: 13, scope: !2)
!34 = !DILocation(line: 32, column: 39, scope: !2)
!35 = !DILocation(line: 32, column: 37, scope: !2)
!36 = !DILocation(line: 32, column: 23, scope: !2)
!37 = !DILocation(line: 32, column: 5, scope: !2)
!38 = !DILocation(line: 33, column: 10, scope: !2)
!39 = !DILocation(line: 33, column: 3, scope: !2)
!40 = !DILocation(line: 42, column: 5, scope: !13)
!41 = !DILocation(line: 43, column: 10, scope: !13)
!42 = !DILocation(line: 43, column: 3, scope: !13)
!43 = !DILocation(line: 52, column: 8, scope: !18)
!44 = !DILocation(line: 52, column: 5, scope: !18)
!45 = !DILocation(line: 53, column: 10, scope: !18)
!46 = !DILocation(line: 53, column: 3, scope: !18)
!47 = distinct !DISubprogram(name: "get_ewma", scope: !3, file: !3, line: 59, type: !14, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!48 = !DILocalVariable(name: "x", scope: !47, file: !3, line: 62, type: !6)
!49 = !DILocation(line: 62, column: 10, scope: !47)
!50 = !DILocation(line: 62, column: 14, scope: !47)
!51 = !DILocalVariable(name: "y", scope: !47, file: !3, line: 63, type: !6)
!52 = !DILocation(line: 63, column: 10, scope: !47)
!53 = !DILocation(line: 63, column: 14, scope: !47)
!54 = !DILocation(line: 64, column: 20, scope: !47)
!55 = !DILocation(line: 64, column: 22, scope: !47)
!56 = !DILocation(line: 64, column: 10, scope: !47)
!57 = !DILocation(line: 64, column: 3, scope: !47)
!58 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 69, type: !59, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!59 = !DISubroutineType(types: !60)
!60 = !{!61}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DILocalVariable(name: "ewma", scope: !58, file: !3, line: 72, type: !6)
!63 = !DILocation(line: 72, column: 10, scope: !58)
!64 = !DILocalVariable(name: "i", scope: !65, file: !3, line: 73, type: !61)
!65 = distinct !DILexicalBlock(scope: !58, file: !3, line: 73, column: 3)
!66 = !DILocation(line: 73, column: 12, scope: !65)
!67 = !DILocation(line: 73, column: 8, scope: !65)
!68 = !DILocation(line: 73, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !3, line: 73, column: 3)
!70 = !DILocation(line: 73, column: 19, scope: !69)
!71 = !DILocation(line: 73, column: 3, scope: !65)
!72 = !DILocation(line: 74, column: 12, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !3, line: 73, column: 30)
!74 = !DILocation(line: 74, column: 10, scope: !73)
!75 = !DILocation(line: 75, column: 20, scope: !73)
!76 = !DILocation(line: 75, column: 5, scope: !73)
!77 = !DILocation(line: 76, column: 3, scope: !73)
!78 = !DILocation(line: 73, column: 26, scope: !69)
!79 = !DILocation(line: 73, column: 3, scope: !69)
!80 = distinct !{!80, !71, !81}
!81 = !DILocation(line: 76, column: 3, scope: !65)
!82 = !DILocation(line: 77, column: 3, scope: !58)
!83 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 80, type: !84, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!84 = !DISubroutineType(types: !85)
!85 = !{!61, !61, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !3, line: 80, type: !61)
!90 = !DILocation(line: 80, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !3, line: 80, type: !86)
!92 = !DILocation(line: 80, column: 27, scope: !83)
!93 = !DILocation(line: 81, column: 10, scope: !83)
!94 = !DILocation(line: 81, column: 3, scope: !83)
