; ModuleID = './divvied/purple/example3.mod.c'
source_filename = "./divvied/purple/example3.mod.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./divvied/purple/example3.mod.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sequence_generator_main() #0 !dbg !7 {
  %1 = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !12, metadata !DIExpression()), !dbg !14
  %2 = bitcast double* %1 to i8*, !dbg !15
  call void @llvm.var.annotation(i8* %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 31), !dbg !15
  br label %3, !dbg !16

3:                                                ; preds = %0, %3
  %4 = call i32 (...) @get_a(), !dbg !17
  %5 = sitofp i32 %4 to double, !dbg !17
  store double %5, double* %1, align 8, !dbg !19
  %6 = load double, double* %1, align 8, !dbg !20
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %6), !dbg !21
  %8 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 3), !dbg !22
  br label %3, !dbg !16, !llvm.loop !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local i32 @get_a(...) #3

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @sleep(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !25 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !31, metadata !DIExpression()), !dbg !32
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !33, metadata !DIExpression()), !dbg !34
  %6 = call i32 @sequence_generator_main(), !dbg !35
  ret i32 %6, !dbg !36
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "divvied/purple/example3.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example3")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)"}
!7 = distinct !DISubprogram(name: "sequence_generator_main", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./divvied/purple/example3.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example3")
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "x", scope: !7, file: !8, line: 31, type: !13)
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !DILocation(line: 31, column: 10, scope: !7)
!15 = !DILocation(line: 31, column: 3, scope: !7)
!16 = !DILocation(line: 34, column: 3, scope: !7)
!17 = !DILocation(line: 35, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !8, line: 34, column: 13)
!19 = !DILocation(line: 35, column: 7, scope: !18)
!20 = !DILocation(line: 36, column: 20, scope: !18)
!21 = !DILocation(line: 36, column: 5, scope: !18)
!22 = !DILocation(line: 37, column: 5, scope: !18)
!23 = distinct !{!23, !16, !24}
!24 = !DILocation(line: 38, column: 3, scope: !7)
!25 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 42, type: !26, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!11, !11, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !DILocalVariable(name: "argc", arg: 1, scope: !25, file: !8, line: 42, type: !11)
!32 = !DILocation(line: 42, column: 14, scope: !25)
!33 = !DILocalVariable(name: "argv", arg: 2, scope: !25, file: !8, line: 42, type: !28)
!34 = !DILocation(line: 42, column: 27, scope: !25)
!35 = !DILocation(line: 43, column: 10, scope: !25)
!36 = !DILocation(line: 43, column: 3, scope: !25)
