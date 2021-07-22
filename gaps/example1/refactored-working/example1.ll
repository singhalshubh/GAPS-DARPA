; ModuleID = './refactored-working/example1.c'
source_filename = "./refactored-working/example1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !11
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./refactored-working/example1.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [16 x i8] c"XDLINKAGE_GET_A\00", section "llvm.metadata"
@get_b.b = internal global double 0.000000e+00, align 8, !dbg !16
@.str.3 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@llvm.global.annotations = appending global [3 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 38 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_a to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 33 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 48 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !23, metadata !DIExpression()), !dbg !24
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !25, metadata !DIExpression()), !dbg !26
  %5 = load double, double* %3, align 8, !dbg !27
  %6 = load double, double* %4, align 8, !dbg !28
  %7 = fadd double %5, %6, !dbg !29
  store double %7, double* @calc_ewma.c, align 8, !dbg !30
  %8 = load double, double* @calc_ewma.c, align 8, !dbg !31
  ret double %8, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_a() #0 !dbg !13 {
  %1 = load double, double* @get_a.a, align 8, !dbg !33
  %2 = fadd double %1, 1.000000e+00, !dbg !33
  store double %2, double* @get_a.a, align 8, !dbg !33
  %3 = load double, double* @get_a.a, align 8, !dbg !34
  ret double %3, !dbg !35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !18 {
  %1 = load double, double* @get_b.b, align 8, !dbg !36
  %2 = fadd double %1, 1.000000e+00, !dbg !36
  store double %2, double* @get_b.b, align 8, !dbg !36
  %3 = load double, double* @get_b.b, align 8, !dbg !37
  ret double %3, !dbg !38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !39 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata double* %2, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata double* %3, metadata !47, metadata !DIExpression()), !dbg !48
  %5 = bitcast double* %3 to i8*, !dbg !49
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 60), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %4, metadata !50, metadata !DIExpression()), !dbg !52
  store i32 0, i32* %4, align 4, !dbg !52
  br label %6, !dbg !53

6:                                                ; preds = %17, %0
  %7 = load i32, i32* %4, align 4, !dbg !54
  %8 = icmp slt i32 %7, 10, !dbg !56
  br i1 %8, label %9, label %20, !dbg !57

9:                                                ; preds = %6
  %10 = call double @get_a(), !dbg !58
  store double %10, double* %1, align 8, !dbg !60
  %11 = call double @get_b(), !dbg !61
  store double %11, double* %2, align 8, !dbg !62
  %12 = load double, double* %1, align 8, !dbg !63
  %13 = load double, double* %2, align 8, !dbg !64
  %14 = call double @calc_ewma(double %12, double %13), !dbg !65
  store double %14, double* %3, align 8, !dbg !66
  %15 = load double, double* %3, align 8, !dbg !67
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double %15), !dbg !68
  br label %17, !dbg !69

17:                                               ; preds = %9
  %18 = load i32, i32* %4, align 4, !dbg !70
  %19 = add nsw i32 %18, 1, !dbg !70
  store i32 %19, i32* %4, align 4, !dbg !70
  br label %6, !dbg !71, !llvm.loop !72

20:                                               ; preds = %6
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !75 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !83, metadata !DIExpression()), !dbg !84
  %6 = call i32 @ewma_main(), !dbg !85
  ret i32 %6, !dbg !86
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 25, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 23, type: !4, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./refactored-working/example1.c", directory: "/workspaces/build/apps/examples/example1")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "refactored-working/example1.c", directory: "/workspaces/build/apps/examples/example1")
!9 = !{}
!10 = !{!0, !11, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "a", scope: !13, file: !3, line: 38, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 33, type: !14, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "b", scope: !18, file: !3, line: 48, type: !6, isLocal: true, isDefinition: true)
!18 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 45, type: !14, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!23 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 23, type: !6)
!24 = !DILocation(line: 23, column: 25, scope: !2)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 23, type: !6)
!26 = !DILocation(line: 23, column: 35, scope: !2)
!27 = !DILocation(line: 27, column: 7, scope: !2)
!28 = !DILocation(line: 27, column: 9, scope: !2)
!29 = !DILocation(line: 27, column: 8, scope: !2)
!30 = !DILocation(line: 27, column: 5, scope: !2)
!31 = !DILocation(line: 28, column: 10, scope: !2)
!32 = !DILocation(line: 28, column: 3, scope: !2)
!33 = !DILocation(line: 41, column: 5, scope: !13)
!34 = !DILocation(line: 42, column: 10, scope: !13)
!35 = !DILocation(line: 42, column: 3, scope: !13)
!36 = !DILocation(line: 51, column: 5, scope: !18)
!37 = !DILocation(line: 52, column: 10, scope: !18)
!38 = !DILocation(line: 52, column: 3, scope: !18)
!39 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 55, type: !40, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!40 = !DISubroutineType(types: !41)
!41 = !{!42}
!42 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!43 = !DILocalVariable(name: "x", scope: !39, file: !3, line: 56, type: !6)
!44 = !DILocation(line: 56, column: 10, scope: !39)
!45 = !DILocalVariable(name: "y", scope: !39, file: !3, line: 57, type: !6)
!46 = !DILocation(line: 57, column: 10, scope: !39)
!47 = !DILocalVariable(name: "ewma", scope: !39, file: !3, line: 60, type: !6)
!48 = !DILocation(line: 60, column: 10, scope: !39)
!49 = !DILocation(line: 60, column: 3, scope: !39)
!50 = !DILocalVariable(name: "i", scope: !51, file: !3, line: 63, type: !42)
!51 = distinct !DILexicalBlock(scope: !39, file: !3, line: 63, column: 3)
!52 = !DILocation(line: 63, column: 12, scope: !51)
!53 = !DILocation(line: 63, column: 8, scope: !51)
!54 = !DILocation(line: 63, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !3, line: 63, column: 3)
!56 = !DILocation(line: 63, column: 19, scope: !55)
!57 = !DILocation(line: 63, column: 3, scope: !51)
!58 = !DILocation(line: 64, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !3, line: 63, column: 30)
!60 = !DILocation(line: 64, column: 7, scope: !59)
!61 = !DILocation(line: 65, column: 9, scope: !59)
!62 = !DILocation(line: 65, column: 7, scope: !59)
!63 = !DILocation(line: 66, column: 22, scope: !59)
!64 = !DILocation(line: 66, column: 24, scope: !59)
!65 = !DILocation(line: 66, column: 12, scope: !59)
!66 = !DILocation(line: 66, column: 10, scope: !59)
!67 = !DILocation(line: 67, column: 20, scope: !59)
!68 = !DILocation(line: 67, column: 5, scope: !59)
!69 = !DILocation(line: 68, column: 3, scope: !59)
!70 = !DILocation(line: 63, column: 26, scope: !55)
!71 = !DILocation(line: 63, column: 3, scope: !55)
!72 = distinct !{!72, !57, !73}
!73 = !DILocation(line: 68, column: 3, scope: !51)
!74 = !DILocation(line: 69, column: 3, scope: !39)
!75 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 72, type: !76, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!76 = !DISubroutineType(types: !77)
!77 = !{!42, !42, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !3, line: 72, type: !42)
!82 = !DILocation(line: 72, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !3, line: 72, type: !78)
!84 = !DILocation(line: 72, column: 27, scope: !75)
!85 = !DILocation(line: 73, column: 10, scope: !75)
!86 = !DILocation(line: 73, column: 3, scope: !75)
