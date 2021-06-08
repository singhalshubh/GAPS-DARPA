; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (double ()* @get_price to i8*), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 32 }], section "llvm.metadata"
@.str.2 = private unnamed_addr constant [20 x i8] c"XDLINKAGE_GET_PRICE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./divvied/orange/example2.mod.c\00", section "llvm.metadata"
@.str = private unnamed_addr constant [7 x i8] c"ORANGE\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [32 x i8] c"./divvied/purple/example2.mod.c\00", section "llvm.metadata"
@.str.3.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2.6 = private unnamed_addr constant [44 x i8] c"[%s]The stock price is %.2f reported at %s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_price() #0 !dbg !9 {
  %1 = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !14, metadata !DIExpression()), !dbg !15
  %2 = bitcast double* %1 to i8*, !dbg !16
  call void @llvm.var.annotation(i8* %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 37), !dbg !16
  store double 0.000000e+00, double* %1, align 8, !dbg !15
  %3 = call i64 @time(i64* null) #5, !dbg !17
  %4 = trunc i64 %3 to i32, !dbg !17
  call void @srand(i32 %4) #5, !dbg !18
  %5 = call i32 @rand() #5, !dbg !19
  %6 = srem i32 %5, 5000, !dbg !20
  %7 = sitofp i32 %6 to double, !dbg !21
  %8 = fdiv double %7, 1.000000e+02, !dbg !22
  %9 = fadd double %8, 7.500000e+02, !dbg !23
  store double %9, double* %1, align 8, !dbg !24
  %10 = load double, double* %1, align 8, !dbg !25
  ret double %10, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @stock_main() #0 !dbg !27 {
  %1 = alloca double, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !32, metadata !DIExpression()), !dbg !33
  %4 = bitcast double* %1 to i8*, !dbg !34
  call void @llvm.var.annotation(i8* %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1.4, i32 0, i32 0), i32 35), !dbg !34
  br label %5, !dbg !35

5:                                                ; preds = %5, %0
  %6 = call i32 (...) bitcast (double ()* @get_price to i32 (...)*)(), !dbg !36
  %7 = sitofp i32 %6 to double, !dbg !36
  store double %7, double* %1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %2, metadata !39, metadata !DIExpression()), !dbg !45
  %8 = call i64 @time(i64* null) #5, !dbg !46
  store i64 %8, i64* %2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %3, metadata !47, metadata !DIExpression()), !dbg !48
  %9 = call i64 @time(i64* null) #5, !dbg !49
  store i64 %9, i64* %3, align 8, !dbg !48
  %10 = call %struct.tm* @localtime(i64* %3) #5, !dbg !50
  %11 = call i8* @asctime(%struct.tm* %10) #5, !dbg !51
  %12 = call i8* @strtok(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.5, i64 0, i64 0)) #5, !dbg !52
  %13 = load double, double* %1, align 8, !dbg !53
  %14 = call %struct.tm* @localtime(i64* %2) #5, !dbg !54
  %15 = call i8* @asctime(%struct.tm* %14) #5, !dbg !55
  %16 = call i8* @strtok(i8* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.5, i64 0, i64 0)) #5, !dbg !56
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.2.6, i64 0, i64 0), i8* %12, double %13, i8* %16), !dbg !57
  %18 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 5), !dbg !58
  br label %5, !dbg !35, !llvm.loop !59
}

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #3

; Function Attrs: nounwind
declare dso_local i8* @asctime(%struct.tm*) #3

; Function Attrs: nounwind
declare dso_local i8* @strtok(i8*, i8*) #3

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @sleep(...) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !61 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !69, metadata !DIExpression()), !dbg !70
  %6 = call i32 @stock_main(), !dbg !71
  ret i32 %6, !dbg !72
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0, !3}
!llvm.ident = !{!5, !5}
!llvm.module.flags = !{!6, !7, !8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "divvied/orange/example2.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example2")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C99, file: !4, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "divvied/purple/example2.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example2")
!5 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)"}
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = distinct !DISubprogram(name: "get_price", scope: !10, file: !10, line: 32, type: !11, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./divvied/orange/example2.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example2")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !DILocalVariable(name: "stockprice", scope: !9, file: !10, line: 37, type: !13)
!15 = !DILocation(line: 37, column: 10, scope: !9)
!16 = !DILocation(line: 37, column: 3, scope: !9)
!17 = !DILocation(line: 40, column: 9, scope: !9)
!18 = !DILocation(line: 40, column: 3, scope: !9)
!19 = !DILocation(line: 41, column: 17, scope: !9)
!20 = !DILocation(line: 41, column: 23, scope: !9)
!21 = !DILocation(line: 41, column: 16, scope: !9)
!22 = !DILocation(line: 41, column: 29, scope: !9)
!23 = !DILocation(line: 41, column: 36, scope: !9)
!24 = !DILocation(line: 41, column: 14, scope: !9)
!25 = !DILocation(line: 42, column: 10, scope: !9)
!26 = !DILocation(line: 42, column: 3, scope: !9)
!27 = distinct !DISubprogram(name: "stock_main", scope: !28, file: !28, line: 32, type: !29, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!28 = !DIFile(filename: "./divvied/purple/example2.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example2")
!29 = !DISubroutineType(types: !30)
!30 = !{!31}
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DILocalVariable(name: "x", scope: !27, file: !28, line: 35, type: !13)
!33 = !DILocation(line: 35, column: 10, scope: !27)
!34 = !DILocation(line: 35, column: 3, scope: !27)
!35 = !DILocation(line: 38, column: 3, scope: !27)
!36 = !DILocation(line: 39, column: 10, scope: !37)
!37 = distinct !DILexicalBlock(scope: !27, file: !28, line: 38, column: 13)
!38 = !DILocation(line: 39, column: 8, scope: !37)
!39 = !DILocalVariable(name: "reportTime", scope: !37, file: !28, line: 40, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !41, line: 7, baseType: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !43, line: 160, baseType: !44)
!43 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!44 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!45 = !DILocation(line: 40, column: 13, scope: !37)
!46 = !DILocation(line: 40, column: 26, scope: !37)
!47 = !DILocalVariable(name: "currTime", scope: !37, file: !28, line: 41, type: !40)
!48 = !DILocation(line: 41, column: 13, scope: !37)
!49 = !DILocation(line: 41, column: 24, scope: !37)
!50 = !DILocation(line: 42, column: 75, scope: !37)
!51 = !DILocation(line: 42, column: 67, scope: !37)
!52 = !DILocation(line: 42, column: 60, scope: !37)
!53 = !DILocation(line: 42, column: 104, scope: !37)
!54 = !DILocation(line: 42, column: 123, scope: !37)
!55 = !DILocation(line: 42, column: 115, scope: !37)
!56 = !DILocation(line: 42, column: 108, scope: !37)
!57 = !DILocation(line: 42, column: 5, scope: !37)
!58 = !DILocation(line: 43, column: 5, scope: !37)
!59 = distinct !{!59, !35, !60}
!60 = !DILocation(line: 44, column: 3, scope: !27)
!61 = distinct !DISubprogram(name: "main", scope: !28, file: !28, line: 48, type: !62, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!31, !31, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !28, line: 48, type: !31)
!68 = !DILocation(line: 48, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !28, line: 48, type: !64)
!70 = !DILocation(line: 48, column: 27, scope: !61)
!71 = !DILocation(line: 49, column: 10, scope: !61)
!72 = !DILocation(line: 49, column: 3, scope: !61)
