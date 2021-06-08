; ModuleID = './divvied/purple/example2.mod.c'
source_filename = "./divvied/purple/example2.mod.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [7 x i8] c"PURPLE\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [32 x i8] c"./divvied/purple/example2.mod.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [44 x i8] c"[%s]The stock price is %.2f reported at %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @stock_main() #0 !dbg !7 {
  %1 = alloca double, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !12, metadata !DIExpression()), !dbg !14
  %4 = bitcast double* %1 to i8*, !dbg !15
  call void @llvm.var.annotation(i8* %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 35), !dbg !15
  br label %5, !dbg !16

5:                                                ; preds = %0, %5
  %6 = call i32 (...) @get_price(), !dbg !17
  %7 = sitofp i32 %6 to double, !dbg !17
  store double %7, double* %1, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata i64* %2, metadata !20, metadata !DIExpression()), !dbg !26
  %8 = call i64 @time(i64* null) #5, !dbg !27
  store i64 %8, i64* %2, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64* %3, metadata !28, metadata !DIExpression()), !dbg !29
  %9 = call i64 @time(i64* null) #5, !dbg !30
  store i64 %9, i64* %3, align 8, !dbg !29
  %10 = call %struct.tm* @localtime(i64* %3) #5, !dbg !31
  %11 = call i8* @asctime(%struct.tm* %10) #5, !dbg !32
  %12 = call i8* @strtok(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5, !dbg !33
  %13 = load double, double* %1, align 8, !dbg !34
  %14 = call %struct.tm* @localtime(i64* %2) #5, !dbg !35
  %15 = call i8* @asctime(%struct.tm* %14) #5, !dbg !36
  %16 = call i8* @strtok(i8* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5, !dbg !37
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.2, i64 0, i64 0), i8* %12, double %13, i8* %16), !dbg !38
  %18 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 5), !dbg !39
  br label %5, !dbg !16, !llvm.loop !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

declare dso_local i32 @get_price(...) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i8* @strtok(i8*, i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @asctime(%struct.tm*) #4

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #4

declare dso_local i32 @sleep(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !42 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !50, metadata !DIExpression()), !dbg !51
  %6 = call i32 @stock_main(), !dbg !52
  ret i32 %6, !dbg !53
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "divvied/purple/example2.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git d24d5c8e308e689dcd83cbafd2e8bd32aa845a15)"}
!7 = distinct !DISubprogram(name: "stock_main", scope: !8, file: !8, line: 32, type: !9, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./divvied/purple/example2.mod.c", directory: "/home/saket/gaps/build/apps/examples/reliable_rpc_examples/example2")
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "x", scope: !7, file: !8, line: 35, type: !13)
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !DILocation(line: 35, column: 10, scope: !7)
!15 = !DILocation(line: 35, column: 3, scope: !7)
!16 = !DILocation(line: 38, column: 3, scope: !7)
!17 = !DILocation(line: 39, column: 10, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !8, line: 38, column: 13)
!19 = !DILocation(line: 39, column: 8, scope: !18)
!20 = !DILocalVariable(name: "reportTime", scope: !18, file: !8, line: 40, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !22, line: 7, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !24, line: 160, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!25 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!26 = !DILocation(line: 40, column: 13, scope: !18)
!27 = !DILocation(line: 40, column: 26, scope: !18)
!28 = !DILocalVariable(name: "currTime", scope: !18, file: !8, line: 41, type: !21)
!29 = !DILocation(line: 41, column: 13, scope: !18)
!30 = !DILocation(line: 41, column: 24, scope: !18)
!31 = !DILocation(line: 42, column: 75, scope: !18)
!32 = !DILocation(line: 42, column: 67, scope: !18)
!33 = !DILocation(line: 42, column: 60, scope: !18)
!34 = !DILocation(line: 42, column: 104, scope: !18)
!35 = !DILocation(line: 42, column: 123, scope: !18)
!36 = !DILocation(line: 42, column: 115, scope: !18)
!37 = !DILocation(line: 42, column: 108, scope: !18)
!38 = !DILocation(line: 42, column: 5, scope: !18)
!39 = !DILocation(line: 43, column: 5, scope: !18)
!40 = distinct !{!40, !16, !41}
!41 = !DILocation(line: 44, column: 3, scope: !7)
!42 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 48, type: !43, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!11, !11, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !8, line: 48, type: !11)
!49 = !DILocation(line: 48, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !8, line: 48, type: !45)
!51 = !DILocation(line: 48, column: 27, scope: !42)
!52 = !DILocation(line: 49, column: 10, scope: !42)
!53 = !DILocation(line: 49, column: 3, scope: !42)
