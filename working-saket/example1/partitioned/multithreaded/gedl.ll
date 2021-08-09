; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global.annotations = appending global [3 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 31 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_a to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 26 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1.4, i32 0, i32 0), i32 35 }], section "llvm.metadata"
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !0
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [36 x i8] c"./divvied-working/orange/example1.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [16 x i8] c"XDLINKAGE_GET_A\00", section "llvm.metadata"
@get_b.b = internal global double 0.000000e+00, align 8, !dbg !11
@.str.3 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [36 x i8] c"./divvied-working/purple/example1.c\00", section "llvm.metadata"
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
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !30, metadata !DIExpression()), !dbg !31
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !32, metadata !DIExpression()), !dbg !33
  %5 = load double, double* %3, align 8, !dbg !34
  %6 = load double, double* %4, align 8, !dbg !35
  %7 = fadd double %5, %6, !dbg !36
  store double %7, double* @calc_ewma.c, align 8, !dbg !37
  %8 = load double, double* @calc_ewma.c, align 8, !dbg !38
  ret double %8, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !13 {
  %1 = load double, double* @get_b.b, align 8, !dbg !40
  %2 = fadd double %1, 1.000000e+00, !dbg !40
  store double %2, double* @get_b.b, align 8, !dbg !40
  %3 = load double, double* @get_b.b, align 8, !dbg !41
  ret double %3, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !43 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata double* %2, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata double* %3, metadata !51, metadata !DIExpression()), !dbg !52
  %5 = bitcast double* %3 to i8*, !dbg !53
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1.4, i32 0, i32 0), i32 47), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %4, metadata !54, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %4, align 4, !dbg !56
  br label %6, !dbg !57

6:                                                ; preds = %18, %0
  %7 = load i32, i32* %4, align 4, !dbg !58
  %8 = icmp slt i32 %7, 5, !dbg !60
  br i1 %8, label %9, label %21, !dbg !61

9:                                                ; preds = %6
  %10 = call i32 (...) bitcast (double ()* @get_a to i32 (...)*)() #4, !dbg !62
  %11 = sitofp i32 %10 to double, !dbg !62
  store double %11, double* %1, align 8, !dbg !64
  %12 = call double @get_b() #4, !dbg !65
  store double %12, double* %2, align 8, !dbg !66
  %13 = load double, double* %1, align 8, !dbg !67
  %14 = load double, double* %2, align 8, !dbg !68
  %15 = call double @calc_ewma(double %13, double %14) #4, !dbg !69
  store double %15, double* %3, align 8, !dbg !70
  %16 = load double, double* %3, align 8, !dbg !71
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2.5, i64 0, i64 0), double %16) #4, !dbg !72
  br label %18, !dbg !73

18:                                               ; preds = %9
  %19 = load i32, i32* %4, align 4, !dbg !74
  %20 = add nsw i32 %19, 1, !dbg !74
  store i32 %20, i32* %4, align 4, !dbg !74
  br label %6, !dbg !75, !llvm.loop !76

21:                                               ; preds = %6
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !79 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !87, metadata !DIExpression()), !dbg !88
  %6 = call i32 @ewma_main() #4, !dbg !89
  ret i32 %6, !dbg !90
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!7, !15}
!llvm.ident = !{!23, !23}
!llvm.module.flags = !{!24, !25, !26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 31, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 26, type: !4, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./divvied-working/orange/example1.c", directory: "/workspaces/build/apps/examples/example1")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "divvied-working/orange/example1.c", directory: "/workspaces/build/apps/examples/example1")
!9 = !{}
!10 = !{!0}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "b", scope: !13, file: !14, line: 35, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_b", scope: !14, file: !14, line: 32, type: !4, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!14 = !DIFile(filename: "./divvied-working/purple/example1.c", directory: "/workspaces/build/apps/examples/example1")
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !17, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "divvied-working/purple/example1.c", directory: "/workspaces/build/apps/examples/example1")
!17 = !{!18, !11}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "c", scope: !20, file: !14, line: 25, type: !6, isLocal: true, isDefinition: true)
!20 = distinct !DISubprogram(name: "calc_ewma", scope: !14, file: !14, line: 23, type: !21, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!21 = !DISubroutineType(types: !22)
!22 = !{!6, !6, !6}
!23 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !DILocation(line: 34, column: 5, scope: !2)
!28 = !DILocation(line: 35, column: 10, scope: !2)
!29 = !DILocation(line: 35, column: 3, scope: !2)
!30 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !14, line: 23, type: !6)
!31 = !DILocation(line: 23, column: 25, scope: !20)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !14, line: 23, type: !6)
!33 = !DILocation(line: 23, column: 35, scope: !20)
!34 = !DILocation(line: 26, column: 7, scope: !20)
!35 = !DILocation(line: 26, column: 11, scope: !20)
!36 = !DILocation(line: 26, column: 9, scope: !20)
!37 = !DILocation(line: 26, column: 5, scope: !20)
!38 = !DILocation(line: 28, column: 10, scope: !20)
!39 = !DILocation(line: 28, column: 3, scope: !20)
!40 = !DILocation(line: 38, column: 5, scope: !13)
!41 = !DILocation(line: 39, column: 10, scope: !13)
!42 = !DILocation(line: 39, column: 3, scope: !13)
!43 = distinct !DISubprogram(name: "ewma_main", scope: !14, file: !14, line: 42, type: !44, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!44 = !DISubroutineType(types: !45)
!45 = !{!46}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DILocalVariable(name: "x", scope: !43, file: !14, line: 43, type: !6)
!48 = !DILocation(line: 43, column: 10, scope: !43)
!49 = !DILocalVariable(name: "y", scope: !43, file: !14, line: 44, type: !6)
!50 = !DILocation(line: 44, column: 10, scope: !43)
!51 = !DILocalVariable(name: "ewma", scope: !43, file: !14, line: 47, type: !6)
!52 = !DILocation(line: 47, column: 10, scope: !43)
!53 = !DILocation(line: 47, column: 3, scope: !43)
!54 = !DILocalVariable(name: "i", scope: !55, file: !14, line: 50, type: !46)
!55 = distinct !DILexicalBlock(scope: !43, file: !14, line: 50, column: 3)
!56 = !DILocation(line: 50, column: 12, scope: !55)
!57 = !DILocation(line: 50, column: 8, scope: !55)
!58 = !DILocation(line: 50, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !14, line: 50, column: 3)
!60 = !DILocation(line: 50, column: 19, scope: !59)
!61 = !DILocation(line: 50, column: 3, scope: !55)
!62 = !DILocation(line: 52, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !14, line: 50, column: 29)
!64 = !DILocation(line: 52, column: 7, scope: !63)
!65 = !DILocation(line: 53, column: 9, scope: !63)
!66 = !DILocation(line: 53, column: 7, scope: !63)
!67 = !DILocation(line: 54, column: 22, scope: !63)
!68 = !DILocation(line: 54, column: 24, scope: !63)
!69 = !DILocation(line: 54, column: 12, scope: !63)
!70 = !DILocation(line: 54, column: 10, scope: !63)
!71 = !DILocation(line: 55, column: 20, scope: !63)
!72 = !DILocation(line: 55, column: 5, scope: !63)
!73 = !DILocation(line: 56, column: 3, scope: !63)
!74 = !DILocation(line: 50, column: 25, scope: !59)
!75 = !DILocation(line: 50, column: 3, scope: !59)
!76 = distinct !{!76, !61, !77}
!77 = !DILocation(line: 56, column: 3, scope: !55)
!78 = !DILocation(line: 57, column: 3, scope: !43)
!79 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 60, type: !80, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !9)
!80 = !DISubroutineType(types: !81)
!81 = !{!46, !46, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !14, line: 60, type: !46)
!86 = !DILocation(line: 60, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !14, line: 60, type: !82)
!88 = !DILocation(line: 60, column: 27, scope: !79)
!89 = !DILocation(line: 61, column: 10, scope: !79)
!90 = !DILocation(line: 61, column: 3, scope: !79)
