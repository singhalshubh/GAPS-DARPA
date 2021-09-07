; ModuleID = './partitioned/multithreaded/purple/example3.c'
source_filename = "./partitioned/multithreaded/purple/example3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [46 x i8] c"./partitioned/multithreaded/purple/example3.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (i32 ()* @ewma_main to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i32 0, i32 0), i32 33 }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ewma_main() #0 !dbg !7 {
  %1 = alloca double, align 8
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double* %1, metadata !12, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %2, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %2, align 4, !dbg !17
  br label %3, !dbg !18

3:                                                ; preds = %10, %0
  %4 = load i32, i32* %2, align 4, !dbg !19
  %5 = icmp slt i32 %4, 10, !dbg !21
  br i1 %5, label %6, label %13, !dbg !22

6:                                                ; preds = %3
  %7 = call double @_rpc_get_ewma(i32* null), !dbg !23
  store double %7, double* %1, align 8, !dbg !25
  %8 = load double, double* %1, align 8, !dbg !26
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %8), !dbg !27
  br label %10, !dbg !28

10:                                               ; preds = %6
  %11 = load i32, i32* %2, align 4, !dbg !29
  %12 = add nsw i32 %11, 1, !dbg !29
  store i32 %12, i32* %2, align 4, !dbg !29
  br label %3, !dbg !30, !llvm.loop !31

13:                                               ; preds = %3
  ret i32 0, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local double @_rpc_get_ewma(i32*) #2

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !34 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !40, metadata !DIExpression()), !dbg !41
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !42, metadata !DIExpression()), !dbg !43
  call void (...) @_master_rpc_init(), !dbg !44
  %6 = call i32 @ewma_main(), !dbg !45
  ret i32 %6, !dbg !46
}

declare dso_local void @_master_rpc_init(...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "partitioned/multithreaded/purple/example3.c", directory: "/workspaces/build/apps/examples/example3")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!7 = distinct !DISubprogram(name: "ewma_main", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./partitioned/multithreaded/purple/example3.c", directory: "/workspaces/build/apps/examples/example3")
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "ewma", scope: !7, file: !8, line: 36, type: !13)
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !DILocation(line: 36, column: 10, scope: !7)
!15 = !DILocalVariable(name: "i", scope: !16, file: !8, line: 37, type: !11)
!16 = distinct !DILexicalBlock(scope: !7, file: !8, line: 37, column: 3)
!17 = !DILocation(line: 37, column: 12, scope: !16)
!18 = !DILocation(line: 37, column: 8, scope: !16)
!19 = !DILocation(line: 37, column: 17, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !8, line: 37, column: 3)
!21 = !DILocation(line: 37, column: 19, scope: !20)
!22 = !DILocation(line: 37, column: 3, scope: !16)
!23 = !DILocation(line: 38, column: 12, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !8, line: 37, column: 30)
!25 = !DILocation(line: 38, column: 10, scope: !24)
!26 = !DILocation(line: 39, column: 20, scope: !24)
!27 = !DILocation(line: 39, column: 5, scope: !24)
!28 = !DILocation(line: 40, column: 3, scope: !24)
!29 = !DILocation(line: 37, column: 26, scope: !20)
!30 = !DILocation(line: 37, column: 3, scope: !20)
!31 = distinct !{!31, !22, !32}
!32 = !DILocation(line: 40, column: 3, scope: !16)
!33 = !DILocation(line: 41, column: 3, scope: !7)
!34 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 44, type: !35, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!11, !11, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!40 = !DILocalVariable(name: "argc", arg: 1, scope: !34, file: !8, line: 44, type: !11)
!41 = !DILocation(line: 44, column: 14, scope: !34)
!42 = !DILocalVariable(name: "argv", arg: 2, scope: !34, file: !8, line: 44, type: !37)
!43 = !DILocation(line: 44, column: 27, scope: !34)
!44 = !DILocation(line: 45, column: 3, scope: !34)
!45 = !DILocation(line: 46, column: 10, scope: !34)
!46 = !DILocation(line: 46, column: 3, scope: !34)
