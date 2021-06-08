; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global.annotations = appending global [2 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double* @get_a.a to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 34 }, { i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_a to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 29 }], section "llvm.metadata"
@get_a.a = internal global double 0.000000e+00, align 8, !dbg !0
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./divvied/orange/example3.mod.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [16 x i8] c"XDLINKAGE_GET_A\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [32 x i8] c"./divvied/purple/example3.mod.c\00", section "llvm.metadata"
@.str.2.5 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_a() #0 !dbg !2 {
  %1 = load double, double* @get_a.a, align 8, !dbg !17
  %2 = fadd double %1, 1.000000e+00, !dbg !17
  store double %2, double* @get_a.a, align 8, !dbg !17
  %3 = load double, double* @get_a.a, align 8, !dbg !18
  ret double %3, !dbg !19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sequence_generator_main() #0 !dbg !20 {
  %1 = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = bitcast double* %1 to i8*, !dbg !27
  call void @llvm.var.annotation(i8* %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1.4, i32 0, i32 0), i32 31), !dbg !27
  br label %3, !dbg !28

3:                                                ; preds = %3, %0
  %4 = call i32 (...) bitcast (double ()* @get_a to i32 (...)*)(), !dbg !29
  %5 = sitofp i32 %4 to double, !dbg !29
  store double %5, double* %1, align 8, !dbg !31
  %6 = load double, double* %1, align 8, !dbg !32
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2.5, i64 0, i64 0), double %6), !dbg !33
  %8 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 3), !dbg !34
  br label %3, !dbg !28, !llvm.loop !35
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @sleep(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !37 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !43, metadata !DIExpression()), !dbg !44
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = call i32 @sequence_generator_main(), !dbg !47
  ret i32 %6, !dbg !48
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7, !11}
!llvm.ident = !{!13, !13}
!llvm.module.flags = !{!14, !15, !16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 34, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "get_a", scope: !3, file: !3, line: 29, type: !4, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "./divvied/orange/example3.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example3")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "divvied/orange/example3.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example3")
!9 = !{}
!10 = !{!0}
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !12, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, splitDebugInlining: false, nameTableKind: None)
!12 = !DIFile(filename: "divvied/purple/example3.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example3")
!13 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)"}
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !DILocation(line: 37, column: 5, scope: !2)
!18 = !DILocation(line: 38, column: 10, scope: !2)
!19 = !DILocation(line: 38, column: 3, scope: !2)
!20 = distinct !DISubprogram(name: "sequence_generator_main", scope: !21, file: !21, line: 28, type: !22, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !9)
!21 = !DIFile(filename: "./divvied/purple/example3.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example3")
!22 = !DISubroutineType(types: !23)
!23 = !{!24}
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DILocalVariable(name: "x", scope: !20, file: !21, line: 31, type: !6)
!26 = !DILocation(line: 31, column: 10, scope: !20)
!27 = !DILocation(line: 31, column: 3, scope: !20)
!28 = !DILocation(line: 34, column: 3, scope: !20)
!29 = !DILocation(line: 35, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !21, line: 34, column: 13)
!31 = !DILocation(line: 35, column: 7, scope: !30)
!32 = !DILocation(line: 36, column: 20, scope: !30)
!33 = !DILocation(line: 36, column: 5, scope: !30)
!34 = !DILocation(line: 37, column: 5, scope: !30)
!35 = distinct !{!35, !28, !36}
!36 = !DILocation(line: 38, column: 3, scope: !20)
!37 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 42, type: !38, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !9)
!38 = !DISubroutineType(types: !39)
!39 = !{!24, !24, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !21, line: 42, type: !24)
!44 = !DILocation(line: 42, column: 14, scope: !37)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !21, line: 42, type: !40)
!46 = !DILocation(line: 42, column: 27, scope: !37)
!47 = !DILocation(line: 43, column: 10, scope: !37)
!48 = !DILocation(line: 43, column: 3, scope: !37)
