; ModuleID = './refactored-working/example1.c'
source_filename = "./refactored-working/example1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !11
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./refactored-working/example1.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [16 x i8] c"XDLINKAGE_GET_A\00", section "llvm.metadata"
@get_b.b = internal global double 1.000000e+00, align 8, !dbg !16
@.str.3 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@llvm.global.annotations = appending global [3 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 39 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_a to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 34 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 48 }], section "llvm.metadata"

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
define dso_local i32 @ewma_main() #0 !dbg !47 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata double* %2, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata double* %3, metadata !55, metadata !DIExpression()), !dbg !56
  %5 = bitcast double* %3 to i8*, !dbg !57
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 59), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %4, metadata !58, metadata !DIExpression()), !dbg !60
  store i32 0, i32* %4, align 4, !dbg !60
  br label %6, !dbg !61

6:                                                ; preds = %17, %0
  %7 = load i32, i32* %4, align 4, !dbg !62
  %8 = icmp slt i32 %7, 10, !dbg !64
  br i1 %8, label %9, label %20, !dbg !65

9:                                                ; preds = %6
  %10 = call double @get_a(), !dbg !66
  store double %10, double* %1, align 8, !dbg !68
  %11 = call double @get_b(), !dbg !69
  store double %11, double* %2, align 8, !dbg !70
  %12 = load double, double* %1, align 8, !dbg !71
  %13 = load double, double* %2, align 8, !dbg !72
  %14 = call double @calc_ewma(double %12, double %13), !dbg !73
  store double %14, double* %3, align 8, !dbg !74
  %15 = load double, double* %3, align 8, !dbg !75
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double %15), !dbg !76
  br label %17, !dbg !77

17:                                               ; preds = %9
  %18 = load i32, i32* %4, align 4, !dbg !78
  %19 = add nsw i32 %18, 1, !dbg !78
  store i32 %19, i32* %4, align 4, !dbg !78
  br label %6, !dbg !79, !llvm.loop !80

20:                                               ; preds = %6
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

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
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 28, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 26, type: !4, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./refactored-working/example1.c", directory: "/workspaces/build/apps/examples/example1")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "refactored-working/example1.c", directory: "/workspaces/build/apps/examples/example1")
!9 = !{}
!10 = !{!0, !11, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "a", scope: !13, file: !3, line: 39, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 34, type: !14, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "b", scope: !18, file: !3, line: 48, type: !6, isLocal: true, isDefinition: true)
!18 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 45, type: !14, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{!"clang version 10.0.0-4ubuntu1 "}
!23 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 26, type: !6)
!24 = !DILocation(line: 26, column: 25, scope: !2)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 26, type: !6)
!26 = !DILocation(line: 26, column: 35, scope: !2)
!27 = !DILocalVariable(name: "alpha", scope: !2, file: !3, line: 27, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!29 = !DILocation(line: 27, column: 17, scope: !2)
!30 = !DILocation(line: 29, column: 16, scope: !2)
!31 = !DILocation(line: 29, column: 20, scope: !2)
!32 = !DILocation(line: 29, column: 18, scope: !2)
!33 = !DILocation(line: 29, column: 13, scope: !2)
!34 = !DILocation(line: 29, column: 39, scope: !2)
!35 = !DILocation(line: 29, column: 37, scope: !2)
!36 = !DILocation(line: 29, column: 23, scope: !2)
!37 = !DILocation(line: 29, column: 5, scope: !2)
!38 = !DILocation(line: 30, column: 10, scope: !2)
!39 = !DILocation(line: 30, column: 3, scope: !2)
!40 = !DILocation(line: 42, column: 5, scope: !13)
!41 = !DILocation(line: 43, column: 10, scope: !13)
!42 = !DILocation(line: 43, column: 3, scope: !13)
!43 = !DILocation(line: 51, column: 8, scope: !18)
!44 = !DILocation(line: 51, column: 5, scope: !18)
!45 = !DILocation(line: 52, column: 10, scope: !18)
!46 = !DILocation(line: 52, column: 3, scope: !18)
!47 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 54, type: !48, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!48 = !DISubroutineType(types: !49)
!49 = !{!50}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "x", scope: !47, file: !3, line: 55, type: !6)
!52 = !DILocation(line: 55, column: 10, scope: !47)
!53 = !DILocalVariable(name: "y", scope: !47, file: !3, line: 56, type: !6)
!54 = !DILocation(line: 56, column: 10, scope: !47)
!55 = !DILocalVariable(name: "ewma", scope: !47, file: !3, line: 59, type: !6)
!56 = !DILocation(line: 59, column: 10, scope: !47)
!57 = !DILocation(line: 59, column: 3, scope: !47)
!58 = !DILocalVariable(name: "i", scope: !59, file: !3, line: 62, type: !50)
!59 = distinct !DILexicalBlock(scope: !47, file: !3, line: 62, column: 3)
!60 = !DILocation(line: 62, column: 12, scope: !59)
!61 = !DILocation(line: 62, column: 8, scope: !59)
!62 = !DILocation(line: 62, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !3, line: 62, column: 3)
!64 = !DILocation(line: 62, column: 19, scope: !63)
!65 = !DILocation(line: 62, column: 3, scope: !59)
!66 = !DILocation(line: 63, column: 9, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !3, line: 62, column: 30)
!68 = !DILocation(line: 63, column: 7, scope: !67)
!69 = !DILocation(line: 64, column: 9, scope: !67)
!70 = !DILocation(line: 64, column: 7, scope: !67)
!71 = !DILocation(line: 65, column: 22, scope: !67)
!72 = !DILocation(line: 65, column: 24, scope: !67)
!73 = !DILocation(line: 65, column: 12, scope: !67)
!74 = !DILocation(line: 65, column: 10, scope: !67)
!75 = !DILocation(line: 66, column: 20, scope: !67)
!76 = !DILocation(line: 66, column: 5, scope: !67)
!77 = !DILocation(line: 67, column: 3, scope: !67)
!78 = !DILocation(line: 62, column: 26, scope: !63)
!79 = !DILocation(line: 62, column: 3, scope: !63)
!80 = distinct !{!80, !65, !81}
!81 = !DILocation(line: 67, column: 3, scope: !59)
!82 = !DILocation(line: 68, column: 3, scope: !47)
!83 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 70, type: !84, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!84 = !DISubroutineType(types: !85)
!85 = !{!50, !50, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !3, line: 70, type: !50)
!90 = !DILocation(line: 70, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !3, line: 70, type: !86)
!92 = !DILocation(line: 70, column: 27, scope: !83)
!93 = !DILocation(line: 71, column: 10, scope: !83)
!94 = !DILocation(line: 71, column: 3, scope: !83)
