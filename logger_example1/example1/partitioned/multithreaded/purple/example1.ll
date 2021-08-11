; ModuleID = './partitioned/multithreaded/purple/example1.c'
source_filename = "./partitioned/multithreaded/purple/example1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@calc_ewma.c = internal global double 0.000000e+00, align 8, !dbg !0
@get_b.b = internal global double 0.000000e+00, align 8, !dbg !11
@.str = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [46 x i8] c"./partitioned/multithreaded/purple/example1.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_b.b to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 36 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calc_ewma(double %0, double %1) #0 !dbg !2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !20, metadata !DIExpression()), !dbg !21
  store double %1, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !22, metadata !DIExpression()), !dbg !23
  %5 = load double, double* %3, align 8, !dbg !24
  %6 = load double, double* %4, align 8, !dbg !25
  %7 = fadd double %5, %6, !dbg !26
  store double %7, double* @calc_ewma.c, align 8, !dbg !27
  %8 = load double, double* @calc_ewma.c, align 8, !dbg !28
  ret double %8, !dbg !29
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_b() #0 !dbg !13 {
  %1 = load double, double* @get_b.b, align 8, !dbg !30
  %2 = fadd double %1, 1.000000e+00, !dbg !30
  store double %2, double* @get_b.b, align 8, !dbg !30
  %3 = load double, double* @get_b.b, align 8, !dbg !31
  ret double %3, !dbg !32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !33 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata double* %2, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata double* %3, metadata !41, metadata !DIExpression()), !dbg !42
  %5 = bitcast double* %3 to i8*, !dbg !43
  call void @llvm.var.annotation(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 48), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %4, metadata !44, metadata !DIExpression()), !dbg !46
  store i32 0, i32* %4, align 4, !dbg !46
  br label %6, !dbg !47

6:                                                ; preds = %17, %0
  %7 = load i32, i32* %4, align 4, !dbg !48
  %8 = icmp slt i32 %7, 5, !dbg !50
  br i1 %8, label %9, label %20, !dbg !51

9:                                                ; preds = %6
  %10 = call double @_rpc_get_a(i32* null, i32* null), !dbg !52
  store double %10, double* %1, align 8, !dbg !54
  %11 = call double @get_b(), !dbg !55
  store double %11, double* %2, align 8, !dbg !56
  %12 = load double, double* %1, align 8, !dbg !57
  %13 = load double, double* %2, align 8, !dbg !58
  %14 = call double @calc_ewma(double %12, double %13), !dbg !59
  store double %14, double* %3, align 8, !dbg !60
  %15 = load double, double* %3, align 8, !dbg !61
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %15), !dbg !62
  br label %17, !dbg !63

17:                                               ; preds = %9
  %18 = load i32, i32* %4, align 4, !dbg !64
  %19 = add nsw i32 %18, 1, !dbg !64
  store i32 %19, i32* %4, align 4, !dbg !64
  br label %6, !dbg !65, !llvm.loop !66

20:                                               ; preds = %6
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local double @_rpc_get_a(i32*, i32*) #3

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !69 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !77, metadata !DIExpression()), !dbg !78
  call void (...) @_master_rpc_init(), !dbg !79
  %6 = call i32 @ewma_main(), !dbg !80
  ret i32 %6, !dbg !81
}

declare dso_local void @_master_rpc_init(...) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "calc_ewma", scope: !3, file: !3, line: 24, type: !4, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./partitioned/multithreaded/purple/example1.c", directory: "/workspaces/build/apps/examples/example1")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "partitioned/multithreaded/purple/example1.c", directory: "/workspaces/build/apps/examples/example1")
!9 = !{}
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "b", scope: !13, file: !3, line: 36, type: !6, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "get_b", scope: !3, file: !3, line: 33, type: !14, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!6}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!20 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !3, line: 24, type: !6)
!21 = !DILocation(line: 24, column: 25, scope: !2)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 24, type: !6)
!23 = !DILocation(line: 24, column: 35, scope: !2)
!24 = !DILocation(line: 27, column: 7, scope: !2)
!25 = !DILocation(line: 27, column: 11, scope: !2)
!26 = !DILocation(line: 27, column: 9, scope: !2)
!27 = !DILocation(line: 27, column: 5, scope: !2)
!28 = !DILocation(line: 29, column: 10, scope: !2)
!29 = !DILocation(line: 29, column: 3, scope: !2)
!30 = !DILocation(line: 39, column: 5, scope: !13)
!31 = !DILocation(line: 40, column: 10, scope: !13)
!32 = !DILocation(line: 40, column: 3, scope: !13)
!33 = distinct !DISubprogram(name: "ewma_main", scope: !3, file: !3, line: 43, type: !34, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!34 = !DISubroutineType(types: !35)
!35 = !{!36}
!36 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!37 = !DILocalVariable(name: "x", scope: !33, file: !3, line: 44, type: !6)
!38 = !DILocation(line: 44, column: 10, scope: !33)
!39 = !DILocalVariable(name: "y", scope: !33, file: !3, line: 45, type: !6)
!40 = !DILocation(line: 45, column: 10, scope: !33)
!41 = !DILocalVariable(name: "ewma", scope: !33, file: !3, line: 48, type: !6)
!42 = !DILocation(line: 48, column: 10, scope: !33)
!43 = !DILocation(line: 48, column: 3, scope: !33)
!44 = !DILocalVariable(name: "i", scope: !45, file: !3, line: 51, type: !36)
!45 = distinct !DILexicalBlock(scope: !33, file: !3, line: 51, column: 3)
!46 = !DILocation(line: 51, column: 12, scope: !45)
!47 = !DILocation(line: 51, column: 8, scope: !45)
!48 = !DILocation(line: 51, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 51, column: 3)
!50 = !DILocation(line: 51, column: 19, scope: !49)
!51 = !DILocation(line: 51, column: 3, scope: !45)
!52 = !DILocation(line: 53, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !3, line: 51, column: 29)
!54 = !DILocation(line: 53, column: 7, scope: !53)
!55 = !DILocation(line: 54, column: 9, scope: !53)
!56 = !DILocation(line: 54, column: 7, scope: !53)
!57 = !DILocation(line: 55, column: 22, scope: !53)
!58 = !DILocation(line: 55, column: 24, scope: !53)
!59 = !DILocation(line: 55, column: 12, scope: !53)
!60 = !DILocation(line: 55, column: 10, scope: !53)
!61 = !DILocation(line: 56, column: 20, scope: !53)
!62 = !DILocation(line: 56, column: 5, scope: !53)
!63 = !DILocation(line: 57, column: 3, scope: !53)
!64 = !DILocation(line: 51, column: 25, scope: !49)
!65 = !DILocation(line: 51, column: 3, scope: !49)
!66 = distinct !{!66, !51, !67}
!67 = !DILocation(line: 57, column: 3, scope: !45)
!68 = !DILocation(line: 58, column: 3, scope: !33)
!69 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 61, type: !70, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!70 = !DISubroutineType(types: !71)
!71 = !{!36, !36, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !3, line: 61, type: !36)
!76 = !DILocation(line: 61, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !3, line: 61, type: !72)
!78 = !DILocation(line: 61, column: 27, scope: !69)
!79 = !DILocation(line: 62, column: 3, scope: !69)
!80 = !DILocation(line: 63, column: 10, scope: !69)
!81 = !DILocation(line: 63, column: 3, scope: !69)
