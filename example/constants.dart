const jarPath = '/home/tamas/Downloads/plantuml-1.2022.0.jar';

const outPrefix = '/tmp/pumli_test';

const simpleModel = '''
@startuml
start
:Hello Pumli user!;
stop
@enduml
''';

const complexModel = r'''
@startuml StateMachine
skinparam {
  shadowing false
  backgroundColor #18191a
  ArrowColor Gray
  ArrowFontColor Gray
  HyperLinkColor DeepSkyBlue
  HyperlinkUnderline false

  StateBackgroundColor transparent
  StateFontColor Gray
  StateAttributeFontColor Gray
  StateBorderColor Gray
  StateStartColor Gray
  StateEndColor Gray
}    

hide empty description
state "m1 something &&% #^" as prefix #transparent;line.dashed;line:Red {
    'States
    state "S.s1" as prefix.S.s1 #721717 {
        state "m1s1" as prefix.S.s1.R0 #transparent;line.dashed;line:Red {
            'States
            state "SS.en1" as prefix.S.s1.R0.SS.en1 #transparent
            prefix.S.s1.R0.SS.en1 : 

            state "SS.s1" as prefix.S.s1.R0.SS.s1 #transparent
            prefix.S.s1.R0.SS.s1 : 
            [*] --> prefix.S.s1.R0.SS.s1

            state "SS.s2" as prefix.S.s1.R0.SS.s2 #721717 {
                        state "m1s1s1" as prefix.S.s1.R0.SS.s2.R0 #transparent;line.dashed;line:Red {
                    'States
                    state "SSS0.en1" as prefix.S.s1.R0.SS.s2.R0.SSS0.en1 #transparent
                    prefix.S.s1.R0.SS.s2.R0.SSS0.en1 : 

                    state "SSS0.s1" as prefix.S.s1.R0.SS.s2.R0.SSS0.s1 #721717
                    prefix.S.s1.R0.SS.s2.R0.SSS0.s1 : 

                    state "SSS0.s2" as prefix.S.s1.R0.SS.s2.R0.SSS0.s2 #transparent
                    prefix.S.s1.R0.SS.s2.R0.SSS0.s2 : 

                    state "SSS0.s3" as prefix.S.s1.R0.SS.s2.R0.SSS0.s3 #transparent
                    prefix.S.s1.R0.SS.s2.R0.SSS0.s3 : 
                    [*] --> prefix.S.s1.R0.SS.s2.R0.SSS0.s3

                    state "SSS0.ex1" as prefix.S.s1.R0.SS.s2.R0.SSS0.ex1 #transparent
                    prefix.S.s1.R0.SS.s2.R0.SSS0.ex1 : 

                    'EntryPoints
                    state "SSS0.en1" as prefix.S.s1.R0.SS.s2.R0.SSS0.en1 <<entryPoint>>
                    prefix.S.s1.R0.SS.s2.R0.SSS0.en1 --> prefix.S.s1.R0.SS.s2.R0.SSS0.s1

                    'ExitPoints
                    state "SSS0.ex1" as prefix.S.s1.R0.SS.s2.R0.SSS0.ex1 <<exitPoint>>

                    'Transitions
                    prefix.S.s1.R0.SS.s2.R0.SSS0.s1 -[#DeepSkyBlue]-> prefix.S.s1.R0.SS.s2.R0.SSS0.s2 : <font:MpX#%7B%22machine%22%3A%22m1s1s1%22%2C%22event%22%3A%22SSE0.e1%22%7D><color:DeepSkyBlue><b>SSE0.e1</b></color></font>\n:SST0.t1
                    prefix.S.s1.R0.SS.s2.R0.SSS0.s1 -[#DeepSkyBlue]-> prefix.S.s1.R0.SS.s2.R0.SSS0.s3 : <font:MpX#%7B%22machine%22%3A%22m1s1s1%22%2C%22event%22%3A%22SSE0.e4%22%7D><color:DeepSkyBlue><b>SSE0.e4</b></color></font>\n:SST0.t2
                    prefix.S.s1.R0.SS.s2.R0.SSS0.s2 -[#Gray]-> prefix.S.s1.R0.SS.s2.R0.SSS0.s1 : SSE0.e2\n:SST0.t3
                    prefix.S.s1.R0.SS.s2.R0.SSS0.s2 -[#Gray]-> prefix.S.s1.R0.SS.s2.R0.SSS0.ex1 : SSE0.e3\n:SST0.t5
                    prefix.S.s1.R0.SS.s2.R0.SSS0.s3 -[#Gray]-> prefix.S.s1.R0.SS.s2.R0.SSS0.s3 : SSE0.e3\n:SST0.t4
                }
            }
            prefix.S.s1.R0.SS.s2 : 

            state "SS.s3" as prefix.S.s1.R0.SS.s3 #transparent
            prefix.S.s1.R0.SS.s3 : 

            state "SS.ex1" as prefix.S.s1.R0.SS.ex1 #transparent
            prefix.S.s1.R0.SS.ex1 : 

            'Exits from region m1s1s1
            prefix.S.s1.R0.SS.s2.R0.SSS0.ex1 -[#Gray]-> prefix.S.s1.R0.SS.ex1 : SE.e5\n:ST.t5

            'EntryPoints
            state "SS.en1" as prefix.S.s1.R0.SS.en1 <<entryPoint>>
            prefix.S.s1.R0.SS.en1 --> prefix.S.s1.R0.SS.s2.R0.SSS0.en1

            'ExitPoints
            state "SS.ex1" as prefix.S.s1.R0.SS.ex1 <<exitPoint>>

            'Transitions
            prefix.S.s1.R0.SS.s1 -[#Gray]-> prefix.S.s1.R0.SS.s1 : SE.e1\n:ST.t3
            prefix.S.s1.R0.SS.s1 -[#Gray]-> prefix.S.s1.R0.SS.s3 : SE.e4\n:ST.t4
            prefix.S.s1.R0.SS.s2 -[#DeepSkyBlue]-> prefix.S.s1.R0.SS.s3 : <font:MpX#%7B%22machine%22%3A%22m1s1%22%2C%22event%22%3A%22SE.e2%22%7D><color:DeepSkyBlue><b>SE.e2</b></color></font>\n:ST.t2\nP = 4
            prefix.S.s1.R0.SS.s2 -[#DeepSkyBlue]-> prefix.S.s1.R0.SS.ex1 : <font:MpX#%7B%22machine%22%3A%22m1s1%22%2C%22event%22%3A%22SE.e5%22%7D><color:DeepSkyBlue><b>SE.e5</b></color></font>\n:ST.t5
            prefix.S.s1.R0.SS.s3 -[#Gray]-> prefix.S.s1.R0.SS.s2 : SE.e3\n:ST.t1\nP = 2
        }
        state "m1s2" as prefix.S.s1.R1 #transparent;line.dashed;line:Red {
            'States
            state "SS2.s1" as prefix.S.s1.R1.SS2.s1 #721717
            prefix.S.s1.R1.SS2.s1 : 
            [*] --> prefix.S.s1.R1.SS2.s1

            state "SS2.s2" as prefix.S.s1.R1.SS2.s2 #transparent {
                        state "m1s2s1" as prefix.S.s1.R1.SS2.s2.R0 #transparent;line.dashed {
                    'States
                    state "SSS1.en1" as prefix.S.s1.R1.SS2.s2.R0.SSS1.en1 #transparent
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.en1 : 

                    state "SSS1.s1" as prefix.S.s1.R1.SS2.s2.R0.SSS1.s1 #transparent
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.s1 : 
                    [*] --> prefix.S.s1.R1.SS2.s2.R0.SSS1.s1

                    state "SSS1.s2" as prefix.S.s1.R1.SS2.s2.R0.SSS1.s2 #transparent
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.s2 : 

                    state "SSS1.s3" as prefix.S.s1.R1.SS2.s2.R0.SSS1.s3 #transparent
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.s3 : 

                    state "SSS1.ex1" as prefix.S.s1.R1.SS2.s2.R0.SSS1.ex1 #transparent
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.ex1 : 

                    'EntryPoints
                    state "SSS1.en1" as prefix.S.s1.R1.SS2.s2.R0.SSS1.en1 <<entryPoint>>
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.en1 --> prefix.S.s1.R1.SS2.s2.R0.SSS1.s2

                    'ExitPoints
                    state "SSS1.ex1" as prefix.S.s1.R1.SS2.s2.R0.SSS1.ex1 <<exitPoint>>

                    'Transitions
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.s1 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R0.SSS1.s2 : SSE1.e1\n:SST1.t1
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.s1 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R0.SSS1.s3 : SSE1.e4\n:SST1.t4
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.s2 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R0.SSS1.s3 : SSE1.e2\n:SST1.t2
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.s2 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R0.SSS1.ex1 : SSE1.e5\n:SST1.t5
                    prefix.S.s1.R1.SS2.s2.R0.SSS1.s3 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R0.SSS1.s1 : SSE1.e3\n:SST1.t3
                }
                        state "m1s2s2" as prefix.S.s1.R1.SS2.s2.R1 #transparent;line.dashed {
                    'States
                    state "SSS2.en1" as prefix.S.s1.R1.SS2.s2.R1.SSS2.en1 #transparent
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.en1 : 

                    state "SSS2.s1" as prefix.S.s1.R1.SS2.s2.R1.SSS2.s1 #transparent
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s1 : 
                    [*] --> prefix.S.s1.R1.SS2.s2.R1.SSS2.s1

                    state "SSS2.s2" as prefix.S.s1.R1.SS2.s2.R1.SSS2.s2 #transparent
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s2 : 

                    state "SSS2.s3" as prefix.S.s1.R1.SS2.s2.R1.SSS2.s3 #transparent
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s3 : 

                    state "SSS2.ex1" as prefix.S.s1.R1.SS2.s2.R1.SSS2.ex1 #transparent
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.ex1 : 

                    'EntryPoints
                    state "SSS2.en1" as prefix.S.s1.R1.SS2.s2.R1.SSS2.en1 <<entryPoint>>
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.en1 --> prefix.S.s1.R1.SS2.s2.R1.SSS2.s2

                    'ExitPoints
                    state "SSS2.ex1" as prefix.S.s1.R1.SS2.s2.R1.SSS2.ex1 <<exitPoint>>

                    'Transitions
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s1 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R1.SSS2.s3 : SSE2.e1\n:SST2.t4
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s1 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R1.SSS2.s3 : SSE2.e4\n:SST2.t2
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s2 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R1.SSS2.s2 : SSE2.e2\n:SST2.t1
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s2 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R1.SSS2.ex1 : SSE2.e5\n:SST2.t5
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s3 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R1.SSS2.s1 : SSE2.e3\n:SST2.t3
                    prefix.S.s1.R1.SS2.s2.R1.SSS2.s3 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R1.SSS2.ex1 : SSE2.e2\n:SST2.t5
                }
                        state "m1s2s3" as prefix.S.s1.R1.SS2.s2.R2 #transparent;line.dashed {
                    'States
                    state "SSS3.en1" as prefix.S.s1.R1.SS2.s2.R2.SSS3.en1 #transparent
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.en1 : 

                    state "SSS3.s1" as prefix.S.s1.R1.SS2.s2.R2.SSS3.s1 #transparent
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.s1 : 
                    [*] --> prefix.S.s1.R1.SS2.s2.R2.SSS3.s1

                    state "SSS3.s2" as prefix.S.s1.R1.SS2.s2.R2.SSS3.s2 #transparent
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.s2 : 

                    state "SSS3.s3" as prefix.S.s1.R1.SS2.s2.R2.SSS3.s3 #transparent
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.s3 : 

                    state "SSS3.ex1" as prefix.S.s1.R1.SS2.s2.R2.SSS3.ex1 #transparent
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.ex1 : 

                    'EntryPoints
                    state "SSS3.en1" as prefix.S.s1.R1.SS2.s2.R2.SSS3.en1 <<entryPoint>>
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.en1 --> prefix.S.s1.R1.SS2.s2.R2.SSS3.s3

                    'ExitPoints
                    state "SSS3.ex1" as prefix.S.s1.R1.SS2.s2.R2.SSS3.ex1 <<exitPoint>>

                    'Transitions
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.s1 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R2.SSS3.s3 : SSE3.e1\n:SST3.t2
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.s1 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R2.SSS3.s1 : SSE3.e4\n:SST3.t3
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.s2 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R2.SSS3.s3 : SSE3.e2\n:SST3.t4
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.s2 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R2.SSS3.ex1 : SSE3.e5\n:SST3.t5
                    prefix.S.s1.R1.SS2.s2.R2.SSS3.s3 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R2.SSS3.s2 : SSE3.e3\n:SST3.t1
                }
            }
            prefix.S.s1.R1.SS2.s2 : 

            state "SS2.s3" as prefix.S.s1.R1.SS2.s3 #transparent
            prefix.S.s1.R1.SS2.s3 : 

            'Exits from region m1s2s1
            'Exits from region m1s2s2
            prefix.S.s1.R1.SS2.s2.R1.SSS2.ex1 -[#Gray]-> prefix.S.s1.R1.SS2.s1 : SE2.e5\n:ST2.t5
            'Exits from region m1s2s3
            prefix.S.s1.R1.SS2.s2.R2.SSS3.ex1 -[#Gray]-> prefix.S.s1.R1.SS2.s3 : SE2.e2\n:ST2.t4

            'EntryPoints

            'ExitPoints

            'Transitions
            prefix.S.s1.R1.SS2.s1 -[#DeepSkyBlue]-> prefix.S.s1.R1.SS2.s1 : <font:MpX#%7B%22machine%22%3A%22m1s2%22%2C%22event%22%3A%22SE2.e1%22%7D><color:DeepSkyBlue><b>SE2.e1</b></color></font>\n:ST2.t3
            prefix.S.s1.R1.SS2.s1 -[#DeepSkyBlue]-> prefix.S.s1.R1.SS2.s3 : <font:MpX#%7B%22machine%22%3A%22m1s2%22%2C%22event%22%3A%22SE2.e4%22%7D><color:DeepSkyBlue><b>SE2.e4</b></color></font>\n:ST2.t2\nP = 4
            prefix.S.s1.R1.SS2.s2 -[#Gray]-> prefix.S.s1.R1.SS2.s3 : SE2.e2\n:ST2.t4
            prefix.S.s1.R1.SS2.s2 -[#Gray]-> prefix.S.s1.R1.SS2.s1 : SE2.e5\n:ST2.t5
            prefix.S.s1.R1.SS2.s3 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R1.SSS2.en1 : SE2.e3\n:ST2.t1\nP = 2
            prefix.S.s1.R1.SS2.s3 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R2.SSS3.en1 : SE2.e3\n:ST2.t1\nP = 2
            prefix.S.s1.R1.SS2.s3 -[#Gray]-> prefix.S.s1.R1.SS2.s2.R1.SSS2.en1 : SE2.e6\n:ST2.t6
        }
    }
    prefix.S.s1 : entry / someEntry()\ndo / do this\nexit / leaving this state
    [*] --> prefix.S.s1

    state "S.s2" as prefix.S.s2 #transparent
    prefix.S.s2 : 

    state "S.s3" as prefix.S.s3 #transparent
    prefix.S.s3 : 

    'Exits from region m1s1
    prefix.S.s1.R0.SS.ex1 -[#Gray]-> prefix.S.s2 : E.e1\n:T.t1\n[always]
    'Exits from region m1s2

    'EntryPoints

    'ExitPoints

    'Transitions
    prefix.S.s1 -[#DeepSkyBlue]-> prefix.S.s2 : <font:MpX#%7B%22machine%22%3A%22m1%20something%20%26%26%25%20%23%5E%22%2C%22event%22%3A%22E.e1%22%7D><color:DeepSkyBlue><b>E.e1</b></color></font>\n:T.t1\n[always]
    prefix.S.s1 -[#DeepSkyBlue]-> prefix.S.s3 : <font:MpX#%7B%22machine%22%3A%22m1%20something%20%26%26%25%20%23%5E%22%2C%22event%22%3A%22E.e6%22%7D><color:DeepSkyBlue><b>E.e6</b></color></font>\n:T.t6\n[just for test]\nP = 12\n{light it up}
    prefix.S.s2 -[#Gray]-> prefix.S.s1.R0.SS.en1 : E.e2\n:T.t2\n[a < b]\n{do that}
    prefix.S.s2 -[#Gray]-> prefix.S.s2 : E.e3\n:T.t3\n[only if empty]
    prefix.S.s3 -[#Gray]-> prefix.S.s3 : E.e4\n:T.t4\n[i == 10]
    prefix.S.s3 -[#Gray]-> prefix.S.s1 : E.e5\n:T.t5
}
@enduml
''';
