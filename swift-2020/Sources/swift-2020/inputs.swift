//
//  File.swift
//  
//
//  Created by Devon DaPuzzo on 12/1/20.
//

import Foundation

extension String {
    func textFileOfNumbersToList() -> [Int] {
        textFileToListOfStrings().map { Int($0)! }
    }

    func textFileToListOfStrings() -> [String] {
        split(separator: "\n").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
}

struct Inputs {
    let day1 = """
                   2004
                   1823
                   1628
                   1867
                   1073
                   1951
                   1909
                   1761
                   1093
                   1992
                   1986
                   1106
                   1537
                   1905
                   1233
                   1961
                   1760
                   1562
                   1781
                   1329
                   1272
                   1660
                   1367
                   1248
                   1697
                   1515
                   1470
                   1980
                   1884
                   1784
                   1966
                   1778
                   1426
                   1255
                   1089
                   1748
                   1253
                   1870
                   1651
                   1131
                   1623
                   1595
                   1128
                   1014
                   1863
                   1855
                   1203
                   1395
                   1521
                   1365
                   1202
                   780
                   1560
                   1834
                   1494
                   1551
                   1398
                   1190
                   1975
                   1940
                   1217
                   1793
                   1310
                   1070
                   1865
                   1307
                   1735
                   1897
                   1410
                   1994
                   1541
                   1569
                   1731
                   1238
                   1193
                   1226
                   1435
                   1159
                   1642
                   1652
                   1908
                   1920
                   1930
                   1068
                   1914
                   1186
                   1795
                   1888
                   1634
                   1750
                   1950
                   1493
                   1353
                   1461
                   1658
                   1856
                   1301
                   1538
                   1948
                   1998
                   1847
                   1880
                   1657
                   1536
                   1457
                   1762
                   1706
                   1894
                   542
                   1991
                   1108
                   1072
                   1064
                   1511
                   1496
                   1480
                   1955
                   1604
                   1766
                   1983
                   1713
                   1234
                   1503
                   1583
                   1729
                   1140
                   1006
                   1600
                   1699
                   1280
                   1891
                   1996
                   1375
                   1167
                   1625
                   1129
                   1770
                   1497
                   1620
                   1267
                   1421
                   1399
                   1563
                   1636
                   1293
                   1506
                   1613
                   1958
                   1967
                   1182
                   1050
                   1947
                   1787
                   1774
                   1928
                   1896
                   1303
                   1826
                   1132
                   1254
                   1752
                   1510
                   1705
                   1229
                   1558
                   1989
                   1567
                   698
                   1738
                   1357
                   1587
                   1316
                   1838
                   1311
                   1057
                   1644
                   1135
                   1300
                   1134
                   1577
                   1381
                   1806
                   1176
                   1993
                   1769
                   1633
                   1450
                   1819
                   1973
                   1694
                   969
                   1987
                   1095
                   1717
                   1933
                   1593
                   1045
                   1355
                   1459
                   1619
               """.textFileOfNumbersToList()

    let day2 = """
               3-5 f: fgfff
               6-20 n: qlzsnnnndwnlhwnxhvjn
               6-7 j: jjjjjwrj
               8-10 g: gggggggggg
               5-6 t: ttttttft
               6-11 h: khmchszhmzm
               4-6 q: qqbjqqqj
               6-8 j: gtkwwjjj
               13-14 w: lwgwrwczwwhkww
               2-4 p: vcnptzdppvpdzp
               4-6 n: pmlnzwrnbnxnpmwmhbnz
               4-9 w: wwprdwwwx
               13-20 b: rbbcbbbbbbbbsbbbbbmj
               1-3 r: zwhrnvr
               4-6 f: fmfgfcf
               13-15 z: zxzzzzzzzzvxkplvzzz
               12-18 r: phjqccgmgzmdwxgtrtb
               5-19 s: ssssssssssssssssssss
               6-7 d: pddqmdd
               7-9 p: pwrlpvlhpfpppzp
               4-5 m: mpmmmm
               9-10 s: ssxsssssrj
               6-9 p: lpjrvpppp
               6-13 r: rrrzvtrgrhqxqrvrvwzr
               1-3 p: dpjp
               6-7 w: wkjnmww
               1-5 r: cfqhhr
               5-9 m: wmmlpgmqmmrm
               12-13 x: sxgnwxxkjwrxr
               6-8 n: lnnrnnnnn
               10-11 q: kqqqzqqfqqqqq
               12-17 k: kkkkkkkkkkpkkhgvnjhk
               12-13 v: vvvvvvvvvvvvvv
               12-15 h: hhhhhhhjkhhhhhth
               6-7 l: hmqtlllnllnlmtqnn
               6-9 m: mcmmmdnmh
               3-5 k: kkhtn
               2-4 n: tnfjmnnn
               5-6 j: cjwlmn
               4-11 b: bcbbkrlgcbbc
               5-10 r: rcrcgrrrzwrrxgpzwrcm
               3-4 n: znnn
               11-14 s: sssjsssssssssss
               6-7 d: rwdddddmdddddkdd
               1-4 s: gssssskssss
               4-5 j: jjjjzj
               11-12 j: cjjjgpjxnjjk
               3-6 z: zzkdzzz
               7-9 d: mkddddqdhddgdd
               1-9 d: rxwqcdrswdg
               2-4 m: gmmmn
               2-4 k: kkkmk
               15-16 r: rrrrrrrrlrrrrrrr
               1-11 g: grgggcgggcggp
               7-8 q: qqqjqqgq
               13-14 c: cxccccgccvcpccccc
               2-5 j: txvwlls
               3-13 w: plwqwhbwdgxcwfmwjl
               9-11 g: ggggggggggggggggdgg
               3-12 g: ggsggggggpgm
               3-11 g: bcgqgxmbjpwm
               8-9 z: zxvzrzzzzzdvzzgz
               17-18 z: zzzxzzzzzzzzzzzzsw
               9-10 t: ftrmtttktttttdtmdk
               15-17 r: rjrrprrrrrrrrrrfrrrr
               7-8 k: kkkkkkkkk
               6-13 n: nnnvnfgntnnnjnnxh
               17-19 l: llllflllllllllllqlrl
               11-13 d: hdlddddddhxddddkd
               13-17 h: hhhhhhhhhhhhnhhhjhhh
               1-12 c: ncccczwcnctcwcc
               4-5 w: wgwkl
               12-13 w: wwwwwwwwwwwwfwww
               3-12 s: scssgwshsspsss
               15-17 w: wwwwwcwxmhwwwwwwwww
               1-3 x: xxxxw
               8-9 p: mpppppppzptp
               11-12 n: nntnbnnnnnmx
               2-10 x: xrspbmkcthqsdxrdxwx
               13-14 l: lllllllpllllll
               5-10 x: xxxxjxjdrx
               7-8 k: kkkkkkjk
               9-11 k: vkkkkkkvkkzddbzr
               3-8 r: lbrrcwbdf
               6-14 l: lgwllrgllllllgllll
               6-9 q: nqqkhqqtqgqc
               2-4 g: ggxggggggg
               12-13 k: kkkkkjkkkkkvf
               5-9 b: scvbbpzbbbzbfb
               16-17 d: mdddddddddddddcttd
               4-10 l: lllflllllllllllllll
               3-6 q: qqqqqtqqqq
               1-3 n: pblsghl
               9-11 v: bvvvmvfvvgtvfpv
               4-5 s: ssshq
               5-8 g: ggwgnggp
               1-4 f: ffmr
               4-5 g: ggwzs
               4-5 h: fhhqs
               10-17 l: clhlllhslxpgljpvlrkl
               7-9 m: pnswhtmvmsrmjwrbfz
               6-16 v: vvvvqcvvvdzvjvldvv
               5-6 c: cntcrl
               12-13 n: nnnnnnnnnnnnln
               2-4 w: wwww
               2-13 w: swrqssmmwrxtw
               15-16 z: zzzzzzzzzzzzzzgqzzz
               6-8 c: cctvkbdcwcbvhc
               1-2 w: wwzdwjtm
               1-3 z: mzzh
               6-13 t: fttttdwtttttkht
               3-9 g: cggfjgqngwmj
               1-5 k: pkkkkkkrk
               1-5 q: qknqd
               7-11 t: tttttckttkb
               6-7 q: qqqqqbl
               16-17 c: ccccccccccccccctc
               2-5 v: vfcnvlvvvxvrnvvvvvv
               1-5 w: nwtwnnwwhtwwdwwww
               2-10 v: ftvxxbjzlqctp
               5-7 d: nddddgddjdbk
               8-11 s: wxqjwkcsflssm
               17-20 v: vvvvvvvvpvgvvvvvvvvv
               6-8 w: wwlwwwqfw
               13-14 r: rrrrgrrrrrrrrr
               5-6 t: ttttzq
               13-14 c: cccccccccccccc
               11-12 k: kwzkkkbdkjkk
               10-11 t: ttttpttttrwwtttt
               3-4 w: ljwwww
               7-8 q: ggqzdvqqw
               1-3 z: zzsg
               1-2 c: crjvdhgwckszmzpcjmr
               10-11 n: nngnntnnnqn
               7-16 w: bwdgwwwgwwnnqtcwc
               4-16 v: vfkvqvvsvnjhfvvv
               10-11 p: fgbhpzqvkmn
               10-11 w: wswgwqwszwwhwnwww
               15-16 t: stwtfxttthptttttt
               1-3 v: vlvsdmrv
               5-8 z: zzzzfzzz
               14-15 t: ttpvtrlqtlcdrlv
               2-6 b: qwfnbkc
               6-9 p: jppjpspplm
               3-4 s: brgqssz
               2-6 q: cqwqlq
               13-14 d: rrdljqdddddcxzdc
               8-13 s: tsnssssssssrcssrssq
               7-8 d: dwddddgl
               9-15 b: gspmhlgbbzbbbrbt
               3-4 h: khhh
               3-4 c: nkccpmcct
               6-7 g: ggggggg
               17-18 p: ppppppppppppppppjnp
               2-6 f: rfjxtff
               3-4 g: ggvg
               7-9 k: kkkkkkkkkkk
               11-16 f: fjdffrtfffjfdffcln
               4-8 w: lhpdwbnfssswwfswwwrw
               5-9 l: lvlllflll
               5-6 t: wtrtlr
               4-8 m: mnmmjgqtgs
               5-11 n: nnrngbnntnk
               5-8 s: ssssfssss
               7-14 m: hrnbhsfcvdmxbmvzfvnq
               1-5 x: xxxxxxxxwxxdg
               1-10 v: vcjvvjvvvv
               5-10 l: vvdmhskmprszklvvl
               3-17 d: dsddkddddddqddddfjdd
               9-13 p: pppppppptpppqp
               12-13 h: hhhhhhhhhhjhh
               1-4 z: mrvlzlzhzlp
               3-4 h: hhmc
               7-17 w: wwwwwwwwwwwwwwwwww
               6-8 z: cgzxzznzzdhcvwh
               4-5 g: mgggg
               7-8 t: ttrthtdkjtgtts
               8-9 w: wwwwwwwpw
               9-15 k: kkkkkkkkkkkkkkk
               8-14 q: qqqqqqqqnqqqqq
               14-19 w: jkwbwwlwdcmwmmwwrwr
               4-5 m: hsxgkdmz
               2-4 v: vsvqvcv
               4-9 h: grhnhhmhhxhlh
               6-14 t: tmttrjbtjtfttc
               1-4 d: pjdbrb
               15-16 r: rrrrrblrrrrrrrxwr
               16-18 p: pppjpppppptpplpppppp
               4-7 x: mxtngxnpsx
               9-10 b: bbbdbqvmrgbzbbbb
               4-5 w: wwwwj
               1-2 d: dgws
               3-10 l: lglsphlbgfmgdtw
               10-11 h: hhhhhfhhhpdhh
               5-9 x: xxxxqgxxjf
               11-19 m: bfmxmmfgzzhqwsmgwmlr
               10-14 x: xxxrxkxxqrlxmpxbdx
               3-8 l: lxlxvwlllznlptfv
               5-9 h: hhthhhhshdq
               1-5 q: sqqqqqqq
               9-14 j: jxfcjpjfjjgjjjjjjjhj
               1-7 g: gvdgjgsvvgnd
               2-5 t: tmttpttttt
               17-19 c: ccccclcccccccccccccc
               10-13 d: mdvddtsddrxtx
               11-12 g: gggggggwggzgp
               3-5 k: hzxnpkq
               9-11 q: qqqqqsqqqqq
               8-9 x: btrkbxngx
               3-5 g: jpkchcxcxhzfhsggqkg
               7-13 s: ssssssssscssssn
               13-15 p: pppppppnppppppp
               5-15 f: ffffjfffffffffgf
               2-4 p: zqphp
               1-4 r: wrrr
               3-9 b: jsjcbrkkczkzmjbg
               1-2 k: kkkkl
               2-3 n: dlnxjwzstsdxns
               7-14 v: fvvvvzhhvpsvvckdvv
               2-8 r: rrrrwrhrrrr
               5-8 n: nnxdnnnnnn
               5-12 c: scmcdscccccmcc
               9-10 v: vvvvvvvvjm
               14-15 w: lwppdwwwwdmrrww
               6-7 c: qcgcvxdrcccpxchrnlq
               8-10 x: hbrqsksxwxxttz
               18-19 w: jnftgwpwmwfdgrcpkww
               3-4 k: ffkj
               5-9 f: flffsvffsff
               3-4 k: kkkkk
               1-3 l: dlglkll
               10-16 f: bfffjzfffnfffffxhfff
               11-20 d: ddbdqsddddddddddfddd
               6-20 l: vmjltmkclbmqrflzgdzl
               5-19 f: ffffffffffffffffffff
               5-10 n: nnnnmnnfnz
               4-13 f: kmrfrfkvjxdbftvhnsdm
               10-11 k: kkkkkkkkskk
               12-13 k: kkkkkkkkkkkhj
               7-8 p: ppppppnhw
               5-8 l: gtpllwklh
               13-14 h: hhhhhhhhzhhwsrh
               7-15 h: hhhhhhthhhhhthqgfh
               1-3 f: mfdmhv
               15-16 f: fffffflfffffffbqf
               12-13 c: cccmcccccccxn
               2-12 q: nqltxqfdcrxqvt
               8-10 d: dddddddddvdddd
               2-9 g: mdrwnvtsd
               12-13 l: lllllllllllll
               2-3 m: mnrgmdm
               6-9 v: hvvvvvvvv
               4-7 q: bqqqrqcqqqq
               8-11 v: vvvvdvvvvvr
               3-4 n: cnnw
               2-12 r: rrrklfrrrksrr
               2-12 p: pxppklhsppwdxwcpzvm
               10-11 n: nnnnnnnnnnn
               5-6 w: wfwwww
               3-5 p: pppppp
               3-8 g: ggggggggggggggg
               1-4 x: xxxxx
               11-16 d: ngcdkglddtppbddgdrd
               11-12 k: kkkkkkkkkkhr
               12-13 c: hgxxchcvxpdlsrt
               1-3 m: vmmm
               4-6 z: kvzgzzzp
               11-12 d: dzddzlcbvdxk
               10-11 g: ggsgggggggggdz
               6-8 q: xfhgpqltbfbdzqg
               4-7 v: vvvlvcxmvvxq
               5-7 v: vkkgvgvnpvvlpgkv
               6-7 b: bbkvnwbqblbvbb
               2-4 l: wmll
               6-9 j: djqjcxxljm
               3-4 j: nmzcsnlnjjjdms
               3-8 w: wnwwsvww
               9-20 m: wbntxzztwmblxmsmltmg
               7-8 r: rprrrtrf
               1-3 r: lnrfxfswmhgvf
               5-12 k: zlkdlktsrqjt
               13-14 v: vvvvvvvvvvvvvbv
               11-12 d: ddddddddddgc
               9-11 c: mdwpjjcdcrc
               5-6 m: mmmmnl
               5-6 l: lblldn
               13-14 c: sccfcxsnsclccc
               4-5 q: qqkkq
               5-8 m: mmmmmmmm
               5-8 z: tzhzzttzvwfcv
               12-15 b: bbbbbbbbbbbtdfb
               7-10 b: bbnplbbxxbh
               1-7 x: zxxxxxvx
               6-17 b: kbnbbbbbptbbrbbbb
               1-3 l: llllll
               13-15 c: ccccccccccccqcz
               1-8 s: sssssssb
               12-19 x: xxxxxxxxpxxcxxxxxxq
               12-13 x: xxxxxxxxxxxxxx
               14-18 w: wwwwwwwwwwwwwlwmbk
               7-8 q: mzwqblqqz
               1-7 p: hrppppgdzp
               2-7 n: qmvpmsjncgkgpbb
               8-10 x: xxxxxxxwxx
               2-4 v: rfcpmpvsswsrjkxpdrxh
               14-16 k: kkkkkkkkkkkhkkskkt
               14-15 d: ddddddkdddddrqdd
               4-16 m: njmqmmmjfmmxhmwgdbc
               12-13 h: hdmdfhhhzhkdhr
               3-14 n: nbntrsmnmrcwbf
               6-8 h: hhwhhlhnhh
               18-19 v: vvvvvvvvvvvvjvvvvvp
               11-20 l: ldllllbvllmqllmlllfl
               2-3 d: dcddd
               4-6 n: bsnncn
               3-6 f: dwlfqfzgs
               8-12 d: xdddddfhnddfddd
               5-13 l: llllqlllllmllll
               10-14 m: mnmzrmmmmwmmqm
               3-12 c: qjchcclnbccccpc
               7-16 j: jjjjjjwjjjjjjrjnjj
               1-10 v: svvdvvgmgpkfkvhvv
               2-4 b: gbpbczblbbv
               7-9 w: drwwbwtgwswwww
               2-8 h: fhkprhplz
               1-6 m: mmmmwm
               3-4 g: gggp
               1-3 q: qqqqj
               10-11 h: htfrdwrnkzntnfpdmkhq
               5-6 x: nxxxxxxxj
               7-8 w: wwwcwwww
               1-5 h: lhhhhh
               7-8 f: ffjfftff
               3-5 g: kdgfgjgbghggp
               2-11 p: flgpvfbhpzxmmntw
               12-13 z: zzzzzzhzzzzgzzqz
               12-13 j: ttmhmdfjpdpnj
               5-7 h: hhhhvhh
               9-13 x: xhxbxxsxxqwxxvxxxx
               1-3 c: ccchcc
               2-5 h: hhrsh
               1-3 q: rqqq
               2-8 x: sxrxbcxx
               12-15 b: bbbbnbbrbcbtbbb
               14-18 m: hmmmmmmmkmmmmmmmmrmm
               1-4 v: vvvv
               5-11 h: brnzvqhrrwh
               4-10 f: dbtfdvlfnffqmwp
               3-16 r: krrrvmrwrrrtrrrrkrwr
               11-15 c: gxbccccccccccbh
               13-18 z: zzrzzzzzzzzzzzzzzzz
               1-3 l: lkvxtrthfvmdzn
               7-9 p: vpppmpppppp
               3-4 w: wwwwwwww
               8-11 z: vlzzzlzvzzmzzz
               2-4 v: vqfv
               10-11 s: sssssslssgss
               4-5 z: zzzww
               11-19 p: zpbpdjfjpdfgnpphhpg
               1-8 f: fftlxmfl
               9-10 p: phlpqzppxpxp
               5-7 q: kbqjqqq
               3-6 m: jcblmv
               9-10 l: llllllllll
               13-14 w: wbwhwwwwhwqwmswwmjwf
               6-11 j: jjjjvtjwjbdjj
               4-8 j: jljjjvgj
               3-4 r: lrhvrzrr
               2-4 p: plpfkphpq
               2-6 b: bbbbrbvwbbgh
               2-11 t: mmjmcwcdcbtztxfbtst
               7-15 r: grsrrjrrtrgvrtrrr
               6-17 d: dddddgddpddzddddddd
               3-10 t: qpnbrnmmjtjxtdg
               6-7 v: vvvvvhb
               5-20 j: vxmkjnssjdtldsdwltlg
               7-10 r: rrrrrrrrrrr
               2-4 r: rrpl
               3-4 m: mmzg
               1-8 h: fshhjrhm
               5-8 m: mmmvmmvmmnmdxnjcjpn
               8-10 m: mmmmmmmlmzmm
               14-15 q: qqqqqqqqqqqqqqb
               6-16 q: qhkdtqnzqqqjgjrqrkbq
               3-9 b: gtbbfgfhbs
               14-16 h: hhhhdhhhmhhhhmhhh
               9-10 n: nnnndnnnvjnl
               11-12 p: pqpppppppppppp
               7-9 d: ddpwfdtdd
               6-10 z: qzzzzjzzmz
               9-14 q: qqdjqdqqrqqwqnqqp
               6-7 k: kkkkkbkk
               7-14 j: hjvjmzkhgltffljjvjj
               4-5 z: znhzz
               11-16 r: rrrrbxdrrqrrsrrb
               5-8 v: vvhvvvvvwvlvhlqg
               4-10 n: wvnnjnndcnk
               5-6 g: ggkggk
               8-9 w: wwwwwwwww
               5-9 r: mrwrrrrrx
               4-6 r: jcfrjrrrg
               6-9 w: wkwwsxwgfcwqb
               5-6 x: grxjxnrb
               2-7 s: nsmldnsszdk
               5-9 j: gjjzkjvjwjcjbj
               6-11 r: jtrgcvwccrrrfmj
               7-12 j: jfjjmjjjjxjqzdjjxq
               1-2 n: nnwqcnr
               5-16 l: lllpclllllllblllll
               5-6 j: wjgdjcdpjxfjxnjj
               3-16 s: klstwqksfclmcbbcn
               17-18 t: ttttdtttttthtttttttt
               9-13 p: ppppppvpvhhqp
               1-2 n: tsnnn
               3-4 p: jpqpjmpplpw
               4-6 t: dtfthsxtfpd
               2-6 m: zhszctkm
               1-13 p: dppmkpbprgppxcpvhrpz
               2-7 m: gvmmflp
               9-16 c: rcdsppjbcwdxnfbc
               5-15 p: pppxpppqnhpptpppz
               10-13 q: xfhqhkqkjqjwqqcfrgl
               14-15 t: tttttttttttttdvtttt
               5-8 q: qqqbqvqzqqn
               1-7 v: cvgvvbcgjv
               6-9 r: rrrrrrrdr
               2-11 j: wjjgxngswkj
               11-13 d: dddddddddddddm
               5-8 p: pzppppppkjp
               15-16 c: cccccccccccccctc
               1-7 c: vsvkccbc
               2-5 h: hhhhchhhhhhhhhh
               9-11 n: nnnnnnnnnnnnn
               11-12 q: mdmfmkxcxzjq
               6-11 m: mmkgnjdhfbc
               1-4 d: dgrdwbdfdkdrmthsj
               12-14 k: kkkkkkkkkrjkkkkk
               2-4 d: hdrvdzd
               2-3 s: sxmsssssssssssssssss
               13-15 z: zzzzzzlzzlzztzzz
               3-8 r: lxrrrnvrtrgnmkrr
               6-7 w: wwlbrwwww
               4-7 r: zlnmmkpnrkkcrrxrmfq
               2-6 v: zgvvjjvvjhjv
               8-11 l: llllllllllcl
               8-14 m: mlmldmmgnqzmmmm
               7-10 z: wzzzzhtzdqzznzz
               4-7 k: mvgwkkk
               5-9 p: pdpltvdpptpppg
               4-15 q: qqqfqbzqlqqqqqpqfqs
               5-7 q: qqqcxqqm
               14-17 x: rltjxxbxxxllsxwcx
               1-13 w: gwggwwwwwwbsbwkwwd
               8-14 k: kkbkkkkhkkkxjzblgk
               5-8 p: cppnpprp
               6-7 k: jrnvhkkgkkb
               12-14 h: hhhhhhhhhhhhhn
               10-20 j: gjwjjjpjjljjjjjsjjjj
               16-17 n: nnnnnnnnnnnnknnnnn
               5-6 f: cdpppf
               12-13 z: bvpzqzzlwzccfszt
               1-9 k: wdkkvtrprltkkltz
               9-16 x: xxxjxdxhtzjxgxsbx
               17-18 j: jjjjjjjjjjjjjjjjlrxj
               2-5 x: xkknmxxxn
               3-9 f: tfffhfffffff
               11-16 r: rrlgrrqmrrprcrrrvjr
               9-12 m: nrlmgmxvgkmpmqvntx
               4-7 r: hrrrzrrnm
               3-15 g: stgjgbgggvdljcgdgfg
               6-9 j: jjjzbpjjjjjj
               2-3 p: ppjp
               9-10 t: tttttttttt
               10-12 w: wwwfwvwvnkwdwww
               11-14 d: nvljddddftrndzx
               6-7 r: rlrrrbqcrqr
               2-4 c: xbdl
               11-18 c: ccccccccccvcccccccc
               5-6 j: gjjjjjj
               3-7 w: xwhnqlhnpfrvlkqqrp
               6-19 q: qqqfxdglhqqkqqqjnhdq
               8-9 d: ddsdddqsv
               14-16 g: gggggggggggggggt
               3-5 b: bbbnh
               11-14 t: mtttwttfttttltq
               8-10 x: xxxcxxxfxq
               8-11 l: lfgvnlzrfcllnxss
               1-3 t: gtttttttwgtptt
               1-20 j: jjgjlqjjcjcjjjsjgjlj
               8-14 v: dqgmngvvqnswvvrrvc
               2-8 m: gmpkmmsmmmmm
               5-6 m: mmmmtm
               6-7 z: zfzrxzxz
               4-15 k: wmwkhhskgwzqpnk
               2-6 d: hddddfzdsdtvg
               9-10 g: gggsggggggrgggqg
               11-12 m: mmmmmmmmmmmm
               5-7 w: wwhqqhwwwwd
               4-9 k: gtkrkkkdfk
               1-4 g: kgtvg
               7-11 r: rhdbzjrwrcr
               9-18 f: fjffffffdffkfffffvf
               3-5 t: ttttt
               13-14 q: qqqqqqqqqqqqcqqq
               1-8 n: vnnnnwnqlbln
               3-5 s: ssmss
               2-4 q: qqqbkvqxh
               3-4 n: nshscq
               10-18 s: sssssssssnsssssssgs
               9-10 v: vvvvvglvzddvvjv
               5-16 s: sspssssrssssslss
               4-7 t: ttptxtt
               2-4 r: rrrrrxdrr
               8-9 b: xqvbbbbbh
               3-4 b: bbbbc
               1-13 v: qhvvvvlvvvvvdv
               4-8 l: lhkllblwllll
               3-4 q: qhjgq
               8-9 p: rpbpppshdpp
               13-18 k: kkkkkkkkkkkkkkkkkx
               8-9 r: rrrrrrrrr
               5-10 f: bjfwwqvjwffpnl
               1-3 l: pbhl
               4-6 g: mggfgv
               1-4 t: tttttt
               5-10 t: llqrtccxtttntxjcdczk
               13-14 q: qqqqmqqqdqqfqgqqqq
               6-10 w: wpwmwwrgwwk
               13-16 q: qqshgkqkqvscqtqq
               4-5 t: qttdt
               2-12 h: fpbbxgpskzjpkvtr
               10-12 z: zrszvzzzzrzkznpzw
               1-4 z: tgzz
               3-6 c: cdwccvgm
               1-15 q: jqqxkqrqmtfqpvbpq
               4-6 v: vjvlvvv
               1-7 l: hjlllwj
               6-13 s: lrspslfwsgjks
               3-4 p: dpvk
               4-8 h: hsjjhhff
               1-18 k: pkkkkkkkkkkkkkkkkkk
               6-8 n: nvcnxqnnrnnn
               7-8 p: ppppppvzp
               12-17 h: hhhhhzhhhhhkhhhhph
               13-17 p: ppmpppnppppplpbvcppp
               8-14 m: tmmcjvmmjgcfmmnj
               1-3 t: tttth
               3-4 x: zxxx
               1-3 d: kpwhxpctcgdbdkb
               5-6 z: knnlzzzzxjrghzb
               9-10 w: wwmwwwwxgww
               9-11 b: bqbbfbbwbbqbb
               2-3 d: ddxp
               10-12 g: gggvgsgtgggggbg
               3-4 b: gbbb
               8-20 c: jccqcxjcqfncfcbccgcc
               4-9 z: zzzztzzzzzb
               2-12 x: gmfmzzrxsqbx
               10-12 x: xxxzbxxjxxxkxb
               3-4 v: szpvbvlvr
               2-5 r: grqqr
               4-8 q: mqqnvqvqqq
               6-10 v: vdbvnvvxvvvnvvvvv
               4-10 d: dddtdddddjd
               3-4 l: klmc
               10-13 k: kkbkkkvkhkvkkkkkl
               1-3 v: vvkz
               13-14 h: pkgffgcszgsghbcdtpm
               11-16 c: dgccccccctchxbfm
               8-9 b: bbbbbbbbbtb
               1-9 h: hrnhhlphhh
               17-18 s: ssssssssssssssssst
               5-10 h: hhhhhzhhhhhx
               2-7 k: dlrncbkkwp
               3-5 k: kfqkk
               4-8 d: ddddddddd
               10-15 m: mmmmrmmmlpmmmrgmkmx
               2-4 g: gsgggkm
               7-9 l: llsllllvrzlxlrgglk
               2-9 f: fzfbvfkff
               13-14 p: pxppppppppppvf
               15-17 z: nbkxkjtszptcndzdl
               3-6 z: zzxzzhz
               12-13 t: tttttttttttttt
               5-10 s: pssbfsbsssnssvsb
               9-18 c: ccxthchscjjdccvcncl
               3-5 f: fndfqffffff
               2-4 m: clwvcdjmz
               7-8 b: bbbpbjbb
               2-3 r: rbxx
               3-8 j: jjjjjjjjj
               5-10 v: zrwnvbrvmm
               4-6 h: hhghhhhh
               6-8 f: fnffzfwfgffpfc
               5-6 q: qvqqqqkqqq
               3-5 v: vgwvrgqc
               9-10 p: pppphbbpphppb
               10-12 l: rdjrcxkgflll
               9-14 h: qwwxnhfhnfhhbhhjr
               9-10 d: ddddpddddd
               4-13 w: wwwwwwwwwwwwwwww
               8-16 x: xrxxxxxxxdlxxxxxxx
               6-10 p: pplppkpzwb
               5-7 j: wpjjjgjjvjqjrgj
               4-13 w: cwwswwwwwjwwdvw
               5-6 j: jjjsjjj
               4-5 c: ccfccqdqctllbm
               7-13 c: bcccccccccccccc
               4-5 p: pgptw
               1-4 p: qpwmp
               3-5 f: fftfff
               2-6 m: mmhbpmjlx
               9-13 r: zrrczrlrzqxrszrrlrr
               2-9 w: xrszwwwdkww
               6-14 g: qlwswsgjdlgmzvwg
               6-8 z: zzzzzzfz
               6-7 w: xwzsjjr
               2-13 f: fxmfdnfffkpggz
               1-7 d: rdnlqdplfddjdd
               11-14 j: kjjvjjjxpjjjjjzjjjz
               12-14 p: gpppwvmqpfpptpfppkpc
               6-11 k: kkkkkhkknkkkkkgk
               2-6 m: swpgmf
               1-3 x: sxzqnxxv
               12-18 n: nnnnlnnnnnnnnnnjnxnn
               3-4 p: pppq
               8-9 v: vvvvvvvpv
               6-9 l: ltsldwtlhll
               11-14 x: xxxxlxxhdtxxxxxsxx
               4-5 q: qsqvqvq
               5-6 b: sbbbbt
               10-13 l: lllllslllrllll
               1-5 m: zmmmmmmm
               2-10 s: ssssssssss
               5-8 r: qqcsbjcrljvksc
               11-15 n: bndcnknnxnnnnnbn
               14-15 v: tvvvvvvvvhqwvvv
               2-3 s: jsvcsb
               12-15 d: mddddfddddlxddddd
               12-18 w: wwznwcgwwwwwwhwwgwgw
               2-9 v: dxlvvlvqg
               2-5 h: njpsxr
               11-13 m: rmmmmmmqmmzmtmm
               4-8 m: smmmmmmm
               3-10 j: ngwtkjfrjjtrxfnvj
               2-3 p: ppwwpp
               3-5 c: cbmcncnqc
               11-13 m: mmmmmmmmmmcmm
               4-14 g: gggggggggggggxg
               2-4 b: bbfb
               16-19 p: ppppppppcppdpppmppwp
               10-12 g: gghgxgkvggrggrg
               1-8 b: wjjqktjbbfkdz
               8-11 c: cqccdcncfcccnc
               2-10 z: qzvlqltzns
               3-7 p: kgpmpzpbx
               1-6 m: mxmdmlmmzmmmmmmmmm
               1-7 r: rrrrrrrrrrrc
               8-10 h: whhhqhhhjjhnch
               6-10 x: xwxxxxkpxdkdnxvh
               10-12 z: zzzzzzkzzpzzzzz
               1-12 s: dssssssssssds
               4-7 f: fvzbfcf
               5-6 w: fwwxfwmswxkd
               14-15 g: gggggggzgggggfhg
               6-7 j: jjjjjnb
               1-6 v: vcgksvnrbgsvkrwsc
               6-15 w: wkvwwwpqwwwbtwxvhw
               8-9 m: smmmmmmmmm
               14-15 r: rrjrlrrrrrrrrzbr
               3-8 w: tjqncxsnqkdpwzm
               4-5 k: kkkkk
               8-11 z: zzzzzzpzzxzzkzglzrz
               5-6 k: kkkktzk
               18-20 w: wwwscwwwwwwwwwwwwgws
               1-12 z: dsfxzctdzzjxbt
               14-15 q: qqqqqdqqqqqqqqq
               7-10 r: rrxrrqrrxcbr
               1-13 d: fmgjzgqhdhddd
               4-6 g: mnggxttn
               6-7 v: gwtmscl
               11-14 g: gggnmgggggjggcgggrgg
               17-18 k: gcslskskkkwkwkklkk
               14-16 r: rrrrrrrrrrrrrbbrr
               13-15 s: sjsxszssgfssdgwsbbsp
               1-9 d: dddddddddddd
               1-13 j: mnjjzckxzjjdj
               1-2 j: hwrqjxxcj
               6-7 z: fzzzwxnnrg
               2-10 x: wxnqjddpxxpxw
               3-10 s: srvvssdcvzfn
               3-11 w: gwwwmwvwwww
               3-4 q: qnqs
               11-12 d: dddqdddzdrddddd
               2-15 l: wldlltxhrwzzlhz
               4-7 g: vgsgkfgmc
               7-9 t: jdsltcgttdttd
               9-10 q: xvqjqqqwqqqqqpqq
               6-9 b: bbkbnbgbbb
               2-5 t: ttcjtbkb
               7-8 r: rdrrqrnrrrrrvp
               2-4 f: pnfqfffvpfffffhbffv
               10-12 z: kzzzzzzzzrzpzszz
               4-5 m: tmmgxlm
               3-4 k: kwhhk
               1-11 h: hhhndhhfhvhchmmqhz
               6-9 m: lmmmmmmmtmmm
               1-5 d: dwdkd
               5-6 d: dddddq
               7-9 j: jjjvgvmjdjbjj
               3-6 w: gwzhpjwkg
               10-11 h: hhlmftlhkhhnh
               8-20 h: hhgnchpthzhhhhqqwhcz
               6-7 s: sssssgfs
               3-11 g: jfgqgbvqppjn
               5-6 d: ddqkmbd
               14-15 h: hhhhhhhhhhhhhphhh
               12-13 l: fwkwphdlwmfwg
               3-4 z: pmbncwz
               3-4 w: lgwv
               3-4 s: sshs
               2-7 z: zzflznzzzlzl
               1-2 k: klbjvbwpkkptb
               17-18 r: rrrrrrrrrrrrrrrrlrr
               7-8 l: mlqgltml
               9-14 l: llljlllxllllvl
               5-13 b: bbbbtbbbbbbbfbbbg
               7-10 d: cddlddgdqkld
               4-6 q: kqqqqq
               5-11 r: rrrvrrrsrjrr
               7-10 t: tttgtltttbt
               13-14 h: hhhhhqhhhhhhndh
               3-4 s: dsss
               6-12 w: jwwtxwwwkkwbw
               7-8 v: cvvgnvvv
               12-16 q: qqqqqqqqxvqqqrqqqq
               6-11 z: zzkvzvzzzxzzzz
               4-9 s: lcrvsssmfs
               6-13 c: ccccpdcbcbcgdcccgdcc
               7-9 q: qpqqqqqqhq
               1-10 k: kwfkkxrkwhtmkwknkx
               9-20 x: dxzrxxxsxxxjxxsxdczx
               15-16 c: ckcccdccccccgccdcccn
               2-7 s: sscxswskxhchxpfs
               2-3 h: hhlh
               2-6 p: ppppppp
               6-8 r: ztmrsjqtrk
               1-2 r: drsdvpmzdn
               6-7 v: vqvvvgp
               5-6 g: gggggg
               3-7 d: tfkddmjzjgdxzlkd
               16-17 b: bbwbbbbbbbbbbbwbt
               2-11 b: hbrwqqhkcrbbvmx
               5-11 f: ffffqfffffffff
               2-5 n: nnwhn
               8-11 j: jxjsjjmjkjkjhjx
               1-3 h: hhhh
               5-12 t: pttttszttwvlt
               7-8 q: mqqqqqqqtkq
               7-10 z: xzzzzzdzzzzzzzz
               6-7 l: ljzqklhmm
               3-5 k: bkkkrk
               6-8 x: xxxxxlxcxxxbx
               6-7 j: jjqjcpjfjj
               8-9 l: cwmllhslwv
               14-15 z: zzzzzzzzrzzzzcz
               11-12 f: sfccmxxffsfg
               5-6 q: qqqqqqqq
               12-15 t: tttttttttttttttt
               7-12 q: pqwsnhqfzdtqxd
               4-5 b: fbcbb
               5-7 t: tttstft
               2-4 h: vjmr
               4-6 r: rrfrprr
               18-19 x: xxkxxxxxxxxxxxxxxxxx
               2-4 k: qklkc
               3-6 s: svjsrs
               14-15 j: pjjjhjjjjjjdjgj
               2-15 l: lhllllllllllllwlll
               2-7 q: qvqqgsq
               2-6 z: zzlzzzn
               8-15 p: pppppppspppzppgp
               3-4 l: kfzbl
               9-12 w: hqjwwtdwwlwwmw
               3-4 k: lghgg
               3-5 k: khgzkk
               2-10 r: rrsjlmrsrr
               2-5 j: jjjjj
               10-12 j: jfgzbdbjwhjjjf
               1-4 f: ffff
               9-10 j: jjjwjjwzgtcjzj
               1-6 m: mmmmmq
               5-6 h: hhwhph
               3-6 w: wwpwwz
               5-6 q: qqqkcb
               8-9 f: ffffffxrff
               13-14 m: lqvpbrhgmxmkgj
               4-6 q: pqqxqk
               7-11 b: mbbnsvbbjbbmb
               17-18 q: qqqqqqqqqqhqqqqqqqq
               3-12 w: qzcwxswwzvwzb
               10-11 l: llllllllxxs
               1-4 c: bvcch
               11-13 s: svssqfvssshst
               6-7 l: lllllrl
               5-8 n: nhqkfnggnpkbhpgntlht
               1-14 g: pgrdgjggggpggc
               12-16 n: hlnhkxpnnsfctsnq
               6-8 c: cccftqcfqc
               1-5 f: fbfff
               1-15 t: mttptftctttptttt
               6-11 t: cxtttnnfttt
               7-11 h: hsrfjswhhhhhhhhc
               12-13 b: bbbbbbbbbbbnfbvb
               12-13 x: lzvxjxxxcxxxq
               12-13 p: ltwhhhqvdjptbsw
               7-9 z: zzzzzztzn
               4-5 g: ggqlgg
               8-10 r: rbqxwzfhlzt
               3-5 g: grhgk
               14-19 z: zrzzbzztszpzvzbdfzm
               7-11 d: tdjbcdpdddb
               3-7 j: jpqjjjj
               1-2 m: mcxklcmmws
               7-8 r: drqlcrfqrgrrxrrg
               1-5 g: kgngw
               8-10 r: wrrbfrrrpntjrrrgrr
               1-4 s: sstf
               3-7 b: fnjnpmfjlwb
               2-5 s: pwjkj
               9-11 t: tbtbtrsrfzntwqq
               13-16 m: mmmmmmmmmmmmmmmmm
               13-18 b: bbbbbbbpqlbbbtbtpxb
               9-11 w: wclwwwrwwwkhww
               7-13 b: bbbbbbbwbbbbb
               8-12 t: sxlwtttttnhn
               4-7 q: kmdqxcqswqw
               3-4 r: rjrr
               4-6 m: mdmdmmmm
               6-17 h: kjrkchhnfhqqcrmhhhdh
               6-9 j: vjjgcjjjpdj
               7-9 x: xxxxsxxxxx
               8-16 j: jjjjjgjnjjjjjjjczd
               6-8 t: tttttttd
               7-17 s: ssmsspvsssspssssfssl
               3-10 f: cgffsqxhdmrvdf
               1-3 f: wfpf
               11-12 k: kkkkkkkkkkfqk
               12-15 s: cxghswzsbttmvpscr
               3-4 n: nnkn
               7-17 w: wwlwnxwxwwswwwwwg
               3-10 h: hhvhhhrhhhfghhcn
               10-11 l: lllxlllllllsl
               5-7 d: ddbddtddv
               5-15 g: ggtggqggggzggggwggv
               2-10 r: mrpdmtrzsrngstsr
               9-15 t: bsbptttttqwzmmtgbgm
               8-10 q: qqqqqqqqqqq
               6-9 h: hlrbcsnhh
               12-17 f: ffkjfffffffnftfmf
               11-12 s: ssssssssssss
               9-15 k: hpkskfkkfkkkkbkk
               8-18 b: bbbbbbdbbbbbbjbbjw
               2-14 p: nppppkkppppppw
               11-12 s: sxhtlrtnbgss
               8-10 q: lnwqqqqqqsqhgqgbq
               2-3 l: llll
               14-17 d: gdddtlfmrdscgsqcmkm
               5-8 w: tmmskwpq
               16-17 b: cbbbpzbbrrbnkbbbbgj
               14-17 b: bbbjbbbbbbbxbvbdszbb
               9-10 q: qqqqqtqqqqr
               5-6 t: ctgttztrtn
               2-3 f: gcfgw
               3-8 d: ddzddddsddddddd
               15-16 g: ggggggjggggggggg
               4-10 m: mcmmmmmmmmmvmmmm
               11-15 p: ptppxjppppmkgpvdp
               12-13 n: nnnnnnnfnnnrn
               1-7 t: tnbwtttmtt
               1-14 c: ndncvjbkcmcjplcp
               1-2 f: fffh
               14-17 t: llzkwltkmdntwndqs
               4-7 w: bffzzwdwtkwwv
               4-8 p: zpbpqpppxpb
               8-14 n: fdnnznhnnlhmtn
               7-14 l: vltrjnzhplkshlt
               1-2 d: ddbhsjtv
               2-10 d: dddddbzrdrdd
               4-10 p: pkppshsfmp
               10-11 g: gmgggzvzmgjgggzqxggd
               2-4 j: fjvjjqf
               5-19 h: cstkhhrctkxhhsfzpph
               6-16 s: sssssssssssssssks
               17-18 v: vvvvvvvvsvvvvvvvtv
               2-5 j: zjjjjj
               2-3 r: xrrrqlxl
               17-19 c: cccrcccgcwcchccccdcc
               7-14 l: lllllllllllllcsl
               12-14 p: jlmhpjgdzjkpnbmnbk
               17-18 n: nnnnnnnnnnnnnnnnqv
               8-10 b: lqzrtbzbrb
               8-11 x: xgxxfxxxxkxx
               5-9 x: xxxsnxnxk
               2-11 t: stxbxwssmgthttx
               6-13 t: ktbktrtqcnlrgtvtwt
               10-12 q: qqqqqqqqqrqq
               14-15 q: znptzmgllrfrqrf
               2-13 f: ffffffcffffff
               9-10 h: hrbhnhhhhhhhh
               8-14 k: lskskkkfzkkkkmkkm
               1-3 g: kbmswhmghvwvnwxzzk
               2-4 v: vttv
               2-3 h: qhhmhghbh
               6-13 t: ttgtttttktttdttt
               7-9 v: vvrrvvvvvv
               5-6 z: hcfwdr
               5-13 g: sgmgggcggggggjrggggk
               10-14 k: kzkkkkkkdskkktkkk
               1-2 j: ptjj
               4-11 b: xnbbbbnbbbb
               14-16 b: bbbbbbbbbbbbbkbc
               4-12 w: mwrwrcpwkpzwxrj
               5-6 l: qlndzlcvw
               1-2 s: ksxk
               4-5 p: spgwql
               7-10 j: ljjjjvxjhzjjjjrj
               6-14 f: ffffffffffffff
               11-15 d: ddddddddddzdpdn
               3-5 t: ttmtz
               6-7 x: kxvxxxx
               3-6 m: mhmklm
               4-8 h: bnhjhphgqxphpnthh
               3-4 w: gwpq
               10-13 t: ttvttjhttcttrtthtb
               1-5 f: ffffg
               6-14 v: rtjjvpbvnvjwlvktvvf
               8-9 n: nnknnnxmnnn
               9-10 v: vvsvvsvvqcvvpp
               9-11 x: xxxxxxxxxwl
               3-6 h: bwqxnrhkhhwhhh
               4-8 l: lvllrlcf
               1-2 m: gtrm
               2-4 z: zzzz
               6-7 j: jjjjjjj
               15-16 g: sggggggggqgclgggmggw
               7-9 v: dvmskjsczkvjcpsv
               3-11 d: hmdrdfdqrddzdddjdd
               7-9 m: mmmwfmmmtmm
               6-8 x: lxsbxmlx
               3-5 q: qqqxq
               5-10 n: nnnnznnnnrn
               4-6 m: zmmbzg
               10-11 c: cpdndvlfltc
               2-4 k: kzkkk
               1-14 m: jmmmmmzmqtmsmmnmm
               3-13 h: gwhhrlbstldmh
               2-5 l: rrlhdqkzst
               1-6 s: sqgsjs
               3-4 h: hhgpb
               11-16 l: llllllllllllllwkllll
               7-11 j: gjjjtvhjjpj
               14-15 h: hjjvmbhfjhhxkbh
               1-2 t: rwxgz
               13-18 p: pppppppppppppppppppp
               1-14 x: xxrxxjxhxxxxxxbxxx
               4-6 b: fbzsbpbbb
               12-16 j: fjjgmnjwbvhjzzzs
               6-7 m: mmmmmtq
               12-16 n: nnmnnpnnnnnknqxkjnjn
               5-8 w: wmwwwwpwlwllzwkcw
               7-10 q: gbpsnqwqfm
               10-13 x: vxxxxxxxxxdqnxx
               7-12 q: qqqqqqqqqqqqqqq
               1-2 n: snnn
               6-10 l: lljllklllwp
               3-4 b: bsnjzbb
               13-14 g: tggztfgdggngmglgg
               6-16 l: bkcwjlwcnfwthlll
               8-11 s: sssssssvsss
               3-4 k: xmthtrcx
               7-8 h: wpmjhbgg
               4-5 p: pcpkvp
               14-15 s: ssrssssssssssjs
               14-15 x: xxxzxxgxxtxxxxqx
               6-7 m: nwmfmxmm
               6-8 k: hsknkmvhkgkkfzkjf
               4-5 s: sssms
               7-9 g: gfgqldxgxdjzglcgg
               10-11 k: ckkthkzpdrfv
               1-14 p: jptppkcppjpppppppp
               10-11 x: pxkccxpxdsq
               2-8 x: xsgxxxxvgxxk
               6-14 j: jjjjjzjjjjjjjtjjjj
               7-10 x: rxxnxrzgxxd
               6-12 g: dmgggpgggwczggghggm
               3-6 h: hdhjhhhhchh
               11-12 r: zrrkcrrrrrlh
               7-9 v: vhqvlvwvzqwqvrxvjnf
               1-5 r: rvmjr
               """.textFileToListOfStrings()


    let day3 = """
               .##.....#....#....#..#.#...#.##
               .###........#.##....#......#..#
               #..#..#.....#...#....#.#.......
               .........#.................#...
               ..#.......#.#.......#.......#.#
               .####........#.#..##.........#.
               ........#.........#.........#..
               #..##...##....#.....##......#..
               .........#..............#......
               #.........#...##.........#.#...
               ..............#........##.....#
               ##....#...........#....#.#...#.
               .....#..#.....#...#.#..........
               #.......#...#..##........##..#.
               .#........#.......#............
               .......##.....#.#.#..#.#.......
               ..#......#..#....##......#.#...
               .....##....#..#.....#..#.......
               .............#.......#.#....#..
               .................#.#......#....
               .#..#....#..........#.....#.##.
               #.#.#.#.....###.......#.....#..
               #...#..........#..#............
               ...#...##.......#.##..#........
               ..#...#.#.##...##.........#.#.#
               .....#...#.#....#.#.....#......
               ...#...#.#..#...#.....#........
               ...........###.#.......#.#.....
               ..#..#.#........#.#.......#.#.#
               .#.......#...........#.........
               .#..#...##....#.......###..##..
               #....#.....#....##..#.........#
               #..#.......#...#......#.#....#.
               ......##..#..#....#.#........##
               #.....#.........#......#..##..#
               .#..#.......#....#............#
               ....#..........#.#...##....#.##
               ..#...#.#...#.###.#..#......#..
               #.#...#..............#.......#.
               ..##.......#......#....###.....
               ......#.......#.#.##.#..##.#...
               .#......#......#.#....#..#.#..#
               ....#....#..#...#.....#.#..#...
               .#.....#.#.#..#........#.#.###.
               #..#..#.#......#..#..#....#.#..
               ..#.###....#....##...#.........
               ...........#..#...........#....
               .................#..........#.#
               .#.#....#..#........#..#.......
               ...........##..#...............
               ...#.##.........#.........#.#.#
               ........#..#....#.#............
               ...##...##..................#.#
               ...#..##..#...#......#.....#..#
               .##.#..#..#......#......#.....#
               ....#.....#....#......##.#.....
               .....#.##....#...#.............
               ......#...#.....##....#...#..##
               ...#............#.###....##....
               ............#.#.#...#.#........
               #.....#..#.#..##...........#.##
               .....#.#.#.#..##......##.#..#..
               .#.##..#.........#......#.....#
               .#.#.#.#.#..#..#........###....
               ......##..........#.#.....##..#
               ..#...#..#.....#.#.....#.......
               ............#....#.............
               ........#...#..#....#.#..###...
               #........##....##..............
               .........#.#.#..#..#...#.#.....
               ....#............#....####...#.
               ##.#.#......#.....#...#....###.
               ...#..#..#..#.......#..#.#.#..#
               ..#..#....#...#.##..#.........#
               #..#.#....#....#...#..##..#.#..
               ...#....#.............#..#.#..#
               ..#......#.##...#..............
               #....##.#.#...##......#.....##.
               .#...##...#...####.....##......
               ...........#.###....#...#...#..
               ##..#..##..#..#.#.#..###.......
               .#...##......#........##..#....
               .#...#...#.....#............#..
               .#.#.#...#.#..#.......#......#.
               .................#..#.#......#.
               #..#####......##.#....#...#....
               ........#......#.....##......#.
               ....#.#...#...#..#.......#####.
               .....##......#...#.......#....#
               .#....#...#..#...#.#...#..#...#
               ....##.........#.#...####.#....
               ...##..........#.#.......##....
               .........#......#.....#....#...
               #....##..#......#.....##....#..
               ...#.#.............#...#.....#.
               ...........#...#.#....#..#.#...
               .......#.#.#.....#..#........#.
               ..##.....#..#.....##..#........
               ...#.#..........#...#....#.#...
               ..#....#......#...#.#...##..#.#
               .#...#..#..#..#.......#........
               .................#.#...........
               ...............#......##.....#.
               ..##.....###..#....#.........##
               ....#.#........#.####.#...#....
               .....#.....##..####..##.......#
               .....####.#...#......#.........
               ........#..#......#.....##.....
               ...###..#.#..###.......#.......
               ...#...##..#..#..#..#.##.......
               ..#......##..#.....##..##......
               #.......#.#..#.................
               #.......#...#..###....#.#.#.#..
               #...#.#....##.##.#...........#.
               .#.........#..###..#.........#.
               #...#......#...#.#.........#...
               .#.##..............#.#....#...#
               ........#.....#..#.#.#......#..
               ............####.#......#......
               ......#.#.#...#.#...#.#.....#..
               ....#....#...#.....#.......#.#.
               ..#....#....###..#....#.....##.
               .................#.....#.#....#
               .#.............#......#.##..#..
               #.....##.......#..#.....#....#.
               #.#......####...##.....#....##.
               .....#.#....#..................
               ....#....#..#.#...........##...
               ...#.............##......#..#..
               ......#..........#...#...##.###
               ...##......##.....#......#....#
               ........#.#.#...#...#..##......
               ......................###....##
               .#.....#..#..#.##.#.#.#....#.##
               .#..............#.....#......#.
               .#...#.##....#.....#.#.#..#..#.
               ##...##.......#.....#..###.....
               ...#..#.#....#........#........
               ....#..............##...#......
               ...........#..#.....##.#.#.#...
               #.#.....##..##.#.#........#....
               .........#....#.....#..##.#...#
               ...#...#..#..#.####...#.......#
               .....##.....##.....#......#....
               #.##...#....#............#..##.
               .#.##..#...#....#.#......#.....
               ..###................#.........
               .#..#..#................#......
               ....#..#........#..#....#......
               .#..........###......#...###...
               ...........##...#.#..#.........
               ...#....#..........#.....#..##.
               ..#..#.............#......###..
               #....#....##.....#....#.##.....
               ......#.......#..#..........##.
               #..##.#...#.#.........#....#.#.
               ...#...#..........#...#..#....#
               ...###..#.#......#.##.#####...#
               ..#.....#.#..............#..##.
               #..###......#.#..#........#....
               .#.......#.......#.....#.##....
               .#...##..#.......##.....#....##
               ..........#.#..#.....#.........
               .......####...#...#.....##.....
               ......#.......#.......#..#.#...
               ...##....##.#.......#.##......#
               .#...#............#......##....
               #..#..#...#.#........#.........
               .......#.......#.....##.#......
               .#....##...#....#.........#...#
               #.#....#.....##...........#..#.
               .....#......#....#......#.#...#
               .#............#...#.#....#....#
               ........##..#..##..##.##....#..
               ........................#.#....
               #....#...#.....................
               ##.#.............#.....#...##.#
               ....##....###.......#..........
               ..#.#..#.#...####.....#.....#..
               #.........#.......#......#..##.
               .#.#.............#..#...#...#..
               #..#....#....#..##.........#...
               #.#.....#.##.#...#.##..#.#..##.
               ......#......#.###....#..###...
               .##...#.......#.........#.#...#
               ..........#...#....#..#....#...
               .....#...#.....#....##....#.#..
               #....#...........#.#...#.......
               .###..#........##..........#...
               ....###.##..#...#.#..##......##
               .#...#...........#...........#.
               #......#....#.##.........##..#.
               .#.......#........#......#.#.#.
               .......#..##.........#......#..
               .#..#.....##....##....#.....#..
               #.#.#.....#...#......#.........
               ..............#.#.........#.#..
               ....#...#.............#.#......
               ..##.#............#.#.##....#..
               .....####..........#.#....##..#
               ......#.#.........#.......###..
               #....##.#...#.#...........#...#
               .....#...#......#....###...#..#
               #....#..............#...#......
               ...#..###...#..........#....#..
               #......#..#.#.#......#..#...#..
               ................##......#..#...
               ....#..#..#........##..#...#...
               ...##.......#.##.#.....##...#.#
               .......#.##.#..#.....#...#.....
               ......#........#..#......##.##.
               ....................#.....#.#..
               .##....#...#...##...#.........#
               ..#...#..#.##..#.#.#......#....
               #....###.#..#..#...#..#...##...
               #.......#.....#.#.......###.#.#
               .#.##...##..#......#....#...#..
               #.....#.......##..#....#.......
               ...###...#............#....#..#
               .#....#.#...#..#..#.##.#.#.#...
               #......#.#..#.#.#......#.......
               ..#..#....###.#........#..#.#..
               .......#......##.........#.....
               ...#...###..#..#.##.#..##......
               .#.......##.......#..#..#.###.#
               .###.#..#.###...........#......
               ...#................#.#...##..#
               ....#.###....#.......#........#
               .##...#...#..#.....#...#.......
               .#...#..#...........#.#......##
               ...##..#.#.#..#.#.#.......#....
               .#.#..#..#.#...........#.......
               ..#....#.#.#.#.#..............#
               ..##..............##....#.#..#.
               ..#....#...##.....###.....#.#.#
               #....#......#..........##......
               .##.#.#......#...##..###..#....
               .#...........#.##.......##..##.
               ###.....##...#.##..#...........
               ...#.....#...........#..#.....#
               #.........#....#.......#.......
               .#.#...#.###....#..#...........
               .....#.......#.....#.##.#.#.#..
               ..##.#.........##.........#..#.
               .......#....#......#.........##
               ...##.....#..#.......#..#.#....
               ..#...###.......#..#....###....
               .......#...###......#.#.....#.#
               #....#...#.#....#.#..........#.
               ........#..#.....#.#.#.........
               ......##.......###.......#...#.
               .........#..#..#.......#.......
               #.......#...#.....#.#..#....#..
               .##....#..###.............#....
               #.#...#.......#.....##.#.#....#
               ....#....##.#........##........
               ...##...#.#.............#...##.
               ##....#.....#..#..#......#.....
               #...#.#........##....##......##
               ..#...........#..#......###....
               ..##..#.....#......#....##.....
               ....###.#...#......##......#...
               ....#....###...........###.#..#
               ..#....#...#.##....#...#.......
               ....##...........#............#
               ..#.#......#......#.##.#...#..#
               #.###.............#.#.##.#.....
               #....##....#..#.#.#...........#
               ...#...................#.......
               .#...#......#.......#.#....#..#
               ....#...#..#..#..#.#.....#....#
               ..#....#............#..###..##.
               ...##...#...........#..#..#.#..
               ..#..#..#.........#.........#.#
               ...#.#.....#.#..##.........#...
               ....#..........................
               ....#.....#.#...#.###.........#
               ....#.#.......#..#.#.#...#...#.
               .....#...#..#.....##....#.#.#..
               #....###......#..#..........#..
               .#.....#......##.......#...#.##
               ...#..#.....#.#.....#.......##.
               ............#..#....#...#..#.#.
               ..........#.#..#..##...........
               .......#.......#..##...##.....#
               ....#...##.#..#...#.#.......#..
               ....#.#........#...####...#....
               #.#.............#.............#
               .#.#......#....#..#..#.....##.#
               #..#...........#........#.....#
               #....#....#.#..#.#....#.#...##.
               ....##...##...#...#...........#
               ...#.#..#....#..#..#..#........
               ...#..##..#........#..........#
               #......#.##..##.......#..#.....
               ..#...#......#...##.#..........
               .###.#..#..#........####...#...
               #..............#.#.#........#..
               ..##....#.......#....##...#..##
               .##...#..#.#.....#..#.......##.
               ..#.........##.......#....#..#.
               .#..#...#..##.#..#.....#.......
               .#....#.........#..#...#...##..
               ..###..######..#.##.#....#.....
               ....#..#.....#.............#..#
               ...#....#.......#..#.#.......##
               .....#......#.......#..##...#..
               .##..#....##..##......#...#..#.
               ......#......#...#...###.......
               ....#.....#.###..##.....#.#.##.
               .......#....#...#..#..#...#.#..
               ...####.#...#...#.#...##....#..
               ......#.#....#....#.#....##....
               #..##...........####....##.#...
               ...#...##.#.......#.#..........
               ..#......#..#..#...#......#....
               ..###..#.....#..#.#.......#...#
               #........#...##..#...#....#....
               ...#.#...#.....#........#...#..
               ...#....#.###...#..#...#..##.#.
               .....#..#..#...#...#..#........
               ..#......##...............#.#.#
               .#...###.#....##..........#.#..
               """

    let day4 = """
               byr:1971
               iyr:2017 hgt:160cm
               eyr:2020 ecl:hzl
               pid:157096267

               hgt:183cm
               pid:368895060
               ecl:oth eyr:2020
               iyr:2013
               byr:1966

               ecl:lzr cid:279 pid:192cm
               hcl:1f7352 iyr:2014 hgt:70cm eyr:1983
               byr:2004

               hcl:#602927 iyr:2018 byr:1938 ecl:blu
               eyr:2024 hgt:172cm
               pid:839621424

               ecl:#12f268
               hcl:#6b5442
               iyr:2012 byr:2011
               eyr:1933 pid:189cm hgt:155in

               byr:1954
               ecl:gry pid:664227667 eyr:2028
               hgt:151cm
               iyr:2019

               ecl:gry
               byr:1931 iyr:2017
               pid:459927933 eyr:2028
               hgt:67in hcl:#fffffd

               cid:322 hgt:163cm
               byr:1969 hcl:#a97842 pid:472877556
               iyr:2019
               ecl:amb eyr:2030

               hcl:#733820 ecl:brn byr:2000 eyr:2022 iyr:2014 cid:320 pid:751634349
               hgt:180cm

               ecl:blu eyr:2028
               hcl:#866857 byr:2029 hgt:191cm iyr:2010
               pid:170cm cid:123

               pid:258660154 byr:1921 hgt:161cm
               eyr:2030
               cid:217 iyr:2012
               hcl:#4dd6d4 ecl:grn

               hgt:170cm byr:1978 eyr:2022 pid:399347273
               iyr:2010 cid:109 ecl:blu hcl:#602927

               pid:172106685
               hgt:183cm
               ecl:gry iyr:2020 eyr:2025 hcl:#18171d byr:1980 cid:289

               cid:77 ecl:#254ad9
               byr:2017 pid:169290741 iyr:2003 hgt:85 hcl:z

               hgt:155cm byr:1987 ecl:oth hcl:#fffffd
               iyr:2010

               ecl:brn iyr:2014 cid:74
               hcl:#623a2f
               hgt:187cm byr:1955 pid:008305281 eyr:2025

               pid:428624233 ecl:grn
               eyr:2027 hgt:167cm hcl:#623a2f byr:1960 iyr:2016

               eyr:2027 pid:358876826 hgt:171cm ecl:oth byr:1957 iyr:2018
               hcl:#ceb3a1
               cid:314

               ecl:grn eyr:2030
               hgt:73in iyr:2011 hcl:#602927

               hgt:76in byr:2029
               pid:2703176 iyr:2020
               eyr:2037 ecl:#95d926
               hcl:9574d2

               eyr:2020 hgt:164cm
               byr:1949 hcl:#fffffd pid:591281293 iyr:2014 cid:136

               cid:268 hgt:73in hcl:#6b5442 eyr:2025 ecl:brn byr:1988 pid:899417027 iyr:2015

               iyr:2020 hcl:#b6652a hgt:177cm
               eyr:2028 ecl:hzl
               byr:1995 pid:594197202

               hcl:#a97842 hgt:179cm byr:1930
               ecl:brn pid:010268954 eyr:2020 iyr:2010

               iyr:2022 pid:93390086
               cid:321 eyr:2034 hcl:#a97842 hgt:168in byr:2006 ecl:#a8f84c

               eyr:2028 ecl:blu byr:1935
               hcl:#6b5442 pid:187679418
               hgt:174cm iyr:2016

               iyr:2019 hgt:164cm pid:704379775
               ecl:oth hcl:#888785 byr:1930
               eyr:2025

               hcl:#6b5442 cid:168
               hgt:171cm eyr:1944 iyr:2018 pid:675364934
               byr:1962
               ecl:hzl

               hcl:z
               eyr:2039
               ecl:zzz pid:26281402 cid:144 iyr:1928
               hgt:166cm

               ecl:hzl hcl:#7d3b0c
               eyr:2022 pid:011589584
               hgt:64in byr:1945 iyr:2014

               byr:1950 hcl:#18171d pid:685748669 eyr:2028 iyr:2010 hgt:176cm ecl:grn

               byr:1989
               hgt:163cm hcl:#18171d ecl:grn iyr:2020 pid:721397788 cid:308 eyr:2020

               pid:443496560 iyr:1999
               eyr:2027 hcl:z
               hgt:69in ecl:zzz byr:2019
               cid:108

               pid:#c9d804 eyr:2011
               ecl:#574df9 iyr:2027 hcl:z byr:2018
               hgt:64

               hgt:69cm
               iyr:1926 hcl:fdcce6
               ecl:#28b358
               eyr:2026
               byr:1994
               pid:76404593

               eyr:2020
               ecl:hzl pid:978839539 hcl:#efcc98
               byr:1935 cid:121
               hgt:165cm

               ecl:amb
               byr:1951 hgt:186cm pid:812513486 iyr:2012 eyr:2029 hcl:#fffffd

               hcl:fcdd61 hgt:168in ecl:grt pid:8474140699 byr:1924 iyr:2027 eyr:2023

               ecl:oth hcl:#866857
               byr:1965 pid:533941934 hgt:166cm iyr:2019 eyr:2040

               eyr:2032 pid:0795438812 iyr:2009 hcl:z
               byr:2028 hgt:131 ecl:gmt

               cid:102 byr:1923 eyr:2025
               pid:222102208 iyr:2019 hcl:#341e13
               hgt:167cm
               ecl:amb

               hgt:180cm byr:1956 iyr:2014 eyr:2022
               ecl:oth cid:175 hcl:#888785

               cid:216 eyr:2022
               ecl:brn pid:002875069 iyr:2019 hcl:#cfa07d byr:1991 hgt:164cm

               iyr:2014 byr:1933 pid:537809907
               hgt:185cm eyr:2029 hcl:#341e13 ecl:blu

               cid:286 hgt:166cm byr:1977 iyr:2012 pid:541909675 ecl:oth eyr:2020
               hcl:#59eb12

               hcl:#18171d cid:329 byr:1921 eyr:2027 iyr:2019
               pid:440820443 hgt:75in ecl:blu

               hcl:#733820 hgt:177cm
               pid:085529831 eyr:2029 iyr:2010 ecl:amb byr:1972

               pid:704125918 hcl:#b6652a byr:1981
               ecl:#698ae8 cid:141 iyr:2018 eyr:2026 hgt:66in

               iyr:2020 eyr:2022
               hgt:191cm hcl:#7d3b0c
               ecl:blu byr:1943 pid:969407635

               pid:10899196
               hgt:161cm
               ecl:lzr iyr:2023 hcl:#ceb3a1 byr:1986 eyr:2012

               hcl:#7d3b0c ecl:utc eyr:2020
               byr:2028 pid:#f8c441 iyr:2030
               hgt:164cm

               byr:2003 hcl:z iyr:2012 hgt:187in
               ecl:gry eyr:2030 pid:150cm

               pid:427618420 hgt:155cm iyr:2012
               ecl:brn
               byr:1948 eyr:2029 hcl:#6b5442

               ecl:oth hgt:81
               byr:2025 cid:66 pid:174cm hcl:z
               eyr:2021

               byr:2027 ecl:lzr hcl:#888785 eyr:1923 hgt:110 cid:54 iyr:1939

               hcl:#341e13 byr:1961 eyr:2022 hgt:163cm cid:137 ecl:amb
               iyr:2019

               hcl:#866857
               iyr:2020
               byr:2005
               hgt:139 ecl:amb cid:181
               eyr:2016
               pid:181cm

               byr:2030
               iyr:2014
               hcl:#733820 cid:74 eyr:2021 hgt:179cm
               pid:7938817872
               ecl:amb

               hcl:91a6dd
               iyr:2019 byr:2024
               hgt:72cm
               ecl:gmt eyr:2023
               pid:8440093771

               ecl:grn byr:1963 cid:60 iyr:2030
               hgt:74 eyr:2022
               pid:193189388
               hcl:#b6652a

               pid:403849590 byr:2012
               eyr:1951 cid:90 iyr:2023
               hgt:69cm hcl:z ecl:gmt

               iyr:2010 hcl:#341e13
               pid:011326174 hgt:185cm byr:1976 cid:207 eyr:2027 ecl:amb

               hgt:64in
               pid:499837104 hcl:#3be285
               byr:1944
               eyr:2024 iyr:2017
               ecl:gry

               eyr:2032 pid:#850d4e hcl:deddda ecl:brn hgt:172 byr:2004
               cid:244 iyr:2022

               hcl:a3346d ecl:amb
               pid:#505713 hgt:74cm eyr:2010 iyr:2020

               byr:1987
               ecl:oth iyr:2012 eyr:2023
               pid:131199420 cid:112 hcl:#a97842

               cid:256 hcl:#a97842 byr:2000 iyr:2018 ecl:oth
               eyr:2022 pid:637777693 hgt:160cm

               hgt:152cm
               cid:164 hcl:#866857 ecl:grn eyr:2025
               pid:495224989 iyr:2020 byr:1949

               iyr:2010
               cid:288 byr:1986 ecl:blu
               pid:304077824
               eyr:2020

               hgt:182cm
               ecl:blu
               hcl:#18171d pid:047931925 byr:1964
               iyr:2012 eyr:2030 cid:167

               byr:1958
               hcl:#866857 iyr:2019 hgt:165cm pid:553631683
               cid:109 ecl:gry
               eyr:2023

               cid:156
               iyr:2014 pid:811368482 eyr:2026 hcl:#b6652a byr:1994
               hgt:184cm ecl:brn

               hcl:#733820
               hgt:183cm ecl:grn
               pid:265625165 byr:1943 cid:344
               iyr:2011

               iyr:2017 hcl:#c0946f pid:716422629 cid:104 byr:1974
               hgt:160cm eyr:2021 ecl:brn

               byr:2002 hgt:180cm hcl:#602927
               eyr:2025 ecl:grn iyr:2011 pid:887584172

               hcl:#888785 ecl:brn eyr:2026
               pid:14483306 byr:1947
               hgt:177cm iyr:2015

               hcl:#b6652a
               ecl:#64783e eyr:2020 hgt:163 pid:651615946
               iyr:2012 byr:1999

               iyr:2014 ecl:gry hgt:188cm eyr:2028 pid:503058612 hcl:#a31066

               hgt:178cm hcl:z
               ecl:amb
               pid:17656631
               eyr:2031 byr:2023

               hgt:166cm pid:783568747 hcl:#341e13
               byr:1955 ecl:grn eyr:2023

               iyr:2016 hgt:161cm byr:1989
               eyr:2023
               ecl:amb pid:133770783
               hcl:#fffffd

               cid:75 byr:1986 eyr:2020 pid:099478576 ecl:blu
               hcl:#733820
               iyr:2011 hgt:158cm

               pid:911200183 hcl:#602927 eyr:2029 iyr:2018 ecl:brn hgt:181cm
               byr:1937

               iyr:1928 byr:2020 hcl:579202
               hgt:60 ecl:utc eyr:1963 pid:157cm
               cid:253

               eyr:2028 iyr:1949
               pid:284455762 hcl:#a97842 ecl:oth byr:1947 hgt:163cm

               hcl:#18171d eyr:2025 cid:222
               byr:1924 ecl:oth
               pid:898594506 hgt:182cm
               iyr:2017

               byr:1935 iyr:2027
               hgt:160in pid:#c090c3
               hcl:#623a2f cid:162 eyr:1942 ecl:amb

               iyr:2014 hgt:160cm eyr:2028 hcl:#623a2f byr:2010
               pid:684765216 ecl:blu

               byr:1958
               hgt:154cm hcl:#a97842
               ecl:oth iyr:2015 eyr:2020 cid:334

               pid:636691339 iyr:2018
               byr:1930
               hcl:#b6652a cid:86
               hgt:184cm ecl:oth
               eyr:2029

               iyr:2025
               hgt:76cm ecl:#043004 hcl:z
               byr:2009 eyr:1999

               eyr:2020 pid:56419390 iyr:2015 hcl:#ceb3a1 ecl:utc
               hgt:98

               iyr:2014 byr:1927 hcl:#fffffd ecl:amb eyr:2022
               hgt:188cm pid:602778565

               hcl:#cfa07d eyr:2029 byr:1937 pid:7912057436
               ecl:hzl
               cid:192 hgt:68in iyr:2012

               hgt:155cm
               iyr:2015 byr:1954 pid:559203670
               ecl:blu hcl:#fffffd eyr:2025

               hcl:#341e13 byr:1998 iyr:2019
               cid:312
               ecl:oth
               pid:230874778 hgt:161cm

               iyr:2011 ecl:amb
               eyr:2026
               hgt:163cm byr:1932 hcl:#733820 pid:850176278

               eyr:2030
               hgt:170cm
               iyr:2017 byr:1972
               pid:014731313
               hcl:#341e13 ecl:brn

               pid:133005637
               hgt:167cm
               cid:317
               eyr:2025 hcl:#341e13 iyr:2012 ecl:gry byr:1950

               iyr:2029 pid:745014772 hgt:68in
               eyr:2034 ecl:hzl
               hcl:ec07ce

               hgt:165cm
               ecl:gry
               hcl:#a97842 byr:1921 cid:263 pid:609363367

               pid:192cm hcl:18f308
               ecl:oth
               eyr:2037 cid:239 iyr:2026 byr:2010

               hcl:d0e525 eyr:2037 iyr:2019
               cid:197
               pid:469740743
               hgt:186in ecl:brn byr:1977

               ecl:hzl cid:254 hgt:165cm
               eyr:2024 byr:1996
               iyr:2021 pid:797277746 hcl:e286e8

               hcl:#b6652a cid:142 ecl:oth hgt:190cm byr:1962 pid:997137384 iyr:2020
               eyr:2029

               ecl:brn byr:1962 hcl:#866857 iyr:2020 hgt:152cm pid:701556397 cid:121 eyr:2029

               eyr:2024 cid:186 hcl:z
               byr:1962 hgt:155cm pid:448098321 iyr:2017 ecl:grn

               iyr:2016
               hgt:168cm byr:1999
               cid:286
               hcl:#18171d pid:223995430 eyr:2022 ecl:blu

               pid:227780276 ecl:blu iyr:2017 byr:1985 hcl:#6b5442 hgt:183cm eyr:2028

               hgt:190cm
               ecl:oth eyr:2030 cid:223 hcl:#888785 iyr:2010
               pid:115829664 byr:1967

               eyr:1992 pid:0688674980 hcl:z
               byr:2028
               hgt:186in ecl:#849f7b
               iyr:2029
               cid:64

               eyr:2025
               iyr:2013 byr:1958 ecl:grn
               hcl:#ceb3a1
               hgt:153cm pid:815357118

               pid:038013822 hgt:180cm iyr:2013
               hcl:#623a2f
               ecl:grn eyr:2029 byr:1949

               byr:1923
               cid:299 hgt:184cm iyr:2020
               hcl:#fffffd eyr:2027
               ecl:hzl

               byr:1930
               iyr:2012
               ecl:grn hcl:#87f2c8 pid:787371085

               iyr:2019
               eyr:2028 pid:107626362 hgt:183cm
               ecl:grt hcl:#623a2f byr:1985

               byr:2011
               hgt:68in iyr:2002 ecl:#5dfa18 hcl:#341e13 pid:205853974

               iyr:2014
               pid:179cm
               hcl:13b9e3 eyr:2022 ecl:#b1759b hgt:184in
               byr:1954

               hgt:183cm hcl:#efcc98
               pid:428260080 cid:231 eyr:2025 ecl:grn
               iyr:2010
               byr:1957

               iyr:2016
               ecl:gry
               pid:192cm eyr:2026
               byr:1956
               hgt:174cm hcl:#623a2f

               eyr:2021 ecl:blu cid:230
               byr:1923
               pid:438732879 hgt:167cm
               hcl:#602927

               byr:1948 ecl:xry
               pid:154cm hgt:179cm eyr:2029 iyr:2017
               hcl:#dd59ab

               hcl:#ceb3a1
               iyr:2014 byr:1981 hgt:167cm ecl:grn
               eyr:2021
               pid:926925947

               iyr:1985
               pid:652196636 hcl:#18171d ecl:#ff3e10 hgt:162cm byr:2012 eyr:2023 cid:171

               eyr:2029
               hgt:166cm
               pid:499909488 byr:1929 hcl:#866857 ecl:brn iyr:2013

               pid:440245122
               byr:1992 hgt:179cm iyr:2010 cid:181 ecl:brn hcl:#888785 eyr:2020

               eyr:2029 hcl:#888785 pid:274994154 ecl:hzl
               iyr:2014 byr:1995

               pid:3195072620
               hcl:z ecl:hzl cid:130 iyr:2030 eyr:2034 hgt:157

               hcl:#1b0a51
               pid:129985083 eyr:2029
               hgt:192cm cid:236 byr:1996 ecl:blu iyr:2016

               ecl:lzr pid:899902347 iyr:1982
               hcl:#cfa07d eyr:2028 byr:1927 hgt:155in

               cid:187 eyr:2029 hcl:#efcc98 byr:1986 pid:760318090
               hgt:169cm iyr:2018 ecl:amb

               hcl:#fffffd eyr:2021 pid:532530085 iyr:2019 byr:1995 hgt:169cm

               iyr:1980
               hcl:z eyr:2019
               hgt:72cm pid:6532875244 ecl:#2f2221 byr:2006

               hgt:174cm byr:1920
               ecl:gry pid:#14fae7 eyr:2026 hcl:#1814d1
               iyr:2013

               hcl:#ceb3a1 ecl:grn
               iyr:2018
               byr:1978
               hgt:183cm pid:566862236
               eyr:2028

               iyr:2020 ecl:amb
               pid:618246345 byr:1940
               hgt:60cm eyr:2027 cid:242 hcl:#b6652a

               ecl:grn
               hcl:#18171d byr:1957 pid:325895714 iyr:2018
               eyr:2023 hgt:162cm

               ecl:#a3ed7b
               byr:2024
               hcl:z eyr:2022 iyr:2016 cid:350 hgt:119 pid:185cm

               iyr:2010
               byr:2004 eyr:2032 cid:326 hcl:6019c5
               ecl:gmt hgt:137

               pid:477848102 eyr:2025 hgt:178cm hcl:#e31a3d ecl:brn
               byr:1943

               pid:#65fca1 eyr:2026 hgt:192cm cid:293 ecl:blu byr:2026 iyr:2024 hcl:#a97842

               eyr:2025 cid:181 hgt:186cm byr:1968
               ecl:brn pid:318405093 hcl:#341e13 iyr:2015

               hcl:#c12f4b eyr:2025 cid:311 pid:652667870
               ecl:oth
               hgt:166cm
               byr:1981 iyr:2016

               ecl:hzl
               byr:2025 iyr:2014
               hcl:138d5c eyr:2037 hgt:160in cid:206
               pid:#d9119b

               pid:51419740 cid:141
               iyr:2012
               hgt:90 ecl:#9438f4 hcl:#7d3b0c byr:2021 eyr:2020

               pid:#0bc613
               hcl:z byr:2017
               hgt:91 cid:284 eyr:1966 iyr:2008
               ecl:#974ceb

               cid:344 iyr:1953 eyr:2020 ecl:hzl byr:2019 hcl:z pid:2969979

               ecl:gry
               byr:1925 cid:113
               hcl:#a97842 pid:744660539 hgt:153cm iyr:2020

               hgt:177 pid:856186682 eyr:1968 ecl:blu
               cid:167 byr:1986 hcl:#866857 iyr:2015

               byr:1937 eyr:2021 iyr:2017
               cid:91 hgt:183cm hcl:#a97842 ecl:blu pid:149192621

               hgt:154cm hcl:#602927 ecl:oth
               byr:1939 iyr:2018 pid:670669747 eyr:2029 cid:301

               eyr:2025 pid:249412970 ecl:oth
               iyr:2016
               byr:1921 hcl:#a97842 hgt:176cm

               byr:1969
               iyr:2019 hcl:9de0cb
               pid:644476999 hgt:75in
               ecl:oth eyr:2022

               hgt:164cm iyr:2016
               byr:1988 ecl:gry
               eyr:2030
               hcl:#efcc98 pid:393258887

               hgt:183cm pid:6930456 eyr:2023 cid:210 ecl:#766482 byr:2023 iyr:2017 hcl:z

               iyr:2011 hgt:165cm eyr:2020 byr:1966
               hcl:#efcc98 pid:691169980 ecl:blu

               iyr:2011 hcl:#602927 eyr:2029
               byr:1966
               ecl:oth hgt:165cm pid:945383793

               pid:567096741 iyr:2025
               ecl:gry eyr:1944 hgt:187in byr:2026 hcl:8ac39a

               byr:2025
               eyr:2025 iyr:2015
               hgt:191 pid:1659927272 ecl:grn

               iyr:2027 hgt:63in byr:1963 pid:874200881
               ecl:oth hcl:#c0946f eyr:2029

               hcl:#b37a48
               byr:1957 ecl:hzl
               eyr:2030
               iyr:2013

               pid:#38e0fd eyr:2019 cid:103
               hgt:153in
               ecl:#956d7c
               iyr:2029 byr:2029 hcl:z

               eyr:2021 pid:956654136
               hcl:#854d9d hgt:186cm byr:1960 iyr:2015

               eyr:2020
               byr:1995
               hcl:#b6652a ecl:amb pid:746523744 iyr:2015
               hgt:178cm

               eyr:2020 hgt:173cm cid:322 byr:1956 iyr:2020 ecl:blu
               pid:833595649

               ecl:gry iyr:2017 eyr:2020 pid:537816651 hgt:183cm cid:160 byr:1996 hcl:#733820

               iyr:1920
               byr:2013
               hcl:z eyr:1932 pid:169cm

               eyr:2030 cid:258 iyr:2020 ecl:grn byr:1947 pid:571610070
               hgt:162cm hcl:#888785

               byr:2025 hgt:155cm iyr:2030 ecl:amb eyr:2002

               iyr:2020 ecl:hzl
               pid:090561426 hcl:#a97842
               byr:1923

               ecl:hzl
               iyr:2019
               hcl:#c0946f eyr:2025
               byr:1999 hgt:178cm pid:026042669

               hgt:74in
               eyr:2027 iyr:2015 ecl:gry
               byr:2005 pid:#28b09d

               eyr:1953 byr:2014 ecl:lzr cid:202 hcl:1af88d
               iyr:2028

               cid:99
               pid:706477697 iyr:2018 hgt:171cm eyr:2027
               ecl:oth
               byr:1978 hcl:#930aef

               iyr:2017
               byr:1935
               eyr:2029
               ecl:amb pid:321873254 hgt:179cm hcl:#1b9aea cid:160

               iyr:2013 ecl:hzl eyr:2023 cid:233 byr:1996 pid:605962483 hgt:175cm hcl:#ceb3a1

               pid:754905579
               ecl:brn eyr:2021 hcl:#ceb3a1
               byr:1943 hgt:59in

               cid:110 byr:1935 eyr:2021 hgt:172cm iyr:2020
               pid:643443673 hcl:#888785 ecl:brn

               ecl:gmt hcl:#cfa07d
               hgt:148 iyr:2024 pid:635827422
               eyr:1935
               byr:1964

               iyr:2012 byr:2016 hcl:z
               hgt:178cm pid:213073693 eyr:2005

               ecl:#b3cc58 byr:2027 pid:172cm hcl:#888785 hgt:177cm eyr:1988
               iyr:2027

               eyr:2029
               byr:1923
               hcl:#d9855b cid:134 pid:068598146 hgt:152cm ecl:blu

               cid:309
               iyr:2010 ecl:oth hgt:188cm hcl:#18171d eyr:2028 pid:174227992 byr:1931

               iyr:2010 hgt:72in cid:266 ecl:brn pid:0090854908
               hcl:#623a2f eyr:2032
               byr:1967

               pid:192554211 eyr:2020 hgt:192cm ecl:gry cid:158 iyr:2015 byr:1940
               hcl:#efcc98

               cid:248 hgt:75in eyr:2025 byr:1957 hcl:#c0946f
               iyr:2019
               ecl:brn

               pid:96533216 hcl:z ecl:blu eyr:2027 hgt:193cm cid:224
               byr:1928 iyr:2014

               iyr:2010
               eyr:2022 cid:276 hcl:#a97842 byr:1968 ecl:gry pid:808830560 hgt:188cm

               hgt:158in
               pid:097590485 iyr:2030 eyr:1940 hcl:z cid:274
               ecl:#2ea9ec
               byr:2024

               pid:616947922 byr:1982 iyr:2014 hgt:186cm ecl:oth hcl:#888785

               byr:1941 pid:039744699 hcl:#efcc98 hgt:190cm iyr:2011
               eyr:2020 ecl:blu

               byr:1971
               ecl:hzl hgt:65in
               pid:076133019 iyr:2019 eyr:2030

               ecl:blu iyr:2011 byr:1928 hcl:#c0946f hgt:172cm eyr:2026 pid:171544458

               byr:1929 pid:145819079 ecl:hzl
               hgt:192cm iyr:2015 eyr:2020 hcl:#b6652a

               byr:1981 ecl:amb pid:123467924
               eyr:2024 hcl:#18171d
               hgt:184cm iyr:2017

               byr:1957
               ecl:oth pid:881258191 hgt:65in iyr:2010
               hcl:#a97842

               ecl:amb eyr:2020 hgt:152cm
               iyr:2021 pid:9448811025 hcl:#c0946f cid:204 byr:2030

               eyr:2022 pid:208725350
               byr:1944 ecl:blu hcl:#18171d cid:164
               hgt:170cm iyr:2014

               hcl:#18171d eyr:1952 iyr:1939 pid:788651896 hgt:157in byr:2007

               byr:1944 cid:87 pid:463367304
               iyr:2020 hgt:188cm ecl:gry
               eyr:2027 hcl:#cfa07d

               ecl:hzl
               iyr:2018 hgt:164cm byr:1972 cid:272 pid:990204374
               hcl:#6b5442

               hgt:155cm pid:791416860 iyr:2015
               cid:278 hcl:#18171d byr:1994 ecl:brn
               eyr:2023

               iyr:2017 cid:245 eyr:2026 byr:1932 ecl:blu
               hgt:159cm pid:904760812 hcl:#18171d

               ecl:blu hcl:#6b5442
               iyr:2015 eyr:2023 pid:535891497 hgt:175cm cid:168 byr:1920

               byr:2000 hcl:#6b5442 hgt:156cm
               pid:765444727 iyr:2012
               ecl:brn
               eyr:2028

               eyr:2005 pid:9092484649
               byr:2028
               ecl:#5fc7fc hgt:81
               iyr:1988 hcl:8280e1

               cid:275
               byr:1928 iyr:2010 hcl:#888785 pid:596954301 ecl:brn eyr:2020 hgt:166cm

               cid:163
               byr:1984 eyr:2027 iyr:2020
               ecl:gry hgt:166cm pid:650001846
               hcl:#602927

               iyr:1925 eyr:2030
               byr:1985 hcl:#cfa07d ecl:#f16a95 hgt:150cm pid:67853501

               ecl:gry
               eyr:1949 cid:218 hgt:73cm byr:2004 pid:055108092
               iyr:1961

               eyr:2024 iyr:2016 pid:133523002
               hgt:62in hcl:#d99c14
               byr:1996 ecl:hzl

               eyr:2026 iyr:2019 hgt:189cm ecl:brn hcl:#623a2f
               byr:1979 pid:172111665

               iyr:2017
               eyr:1937 ecl:#bfd0ee
               byr:1964 hcl:#733820
               hgt:169cm pid:33181449

               eyr:2024 hcl:#6b5442
               iyr:2014
               hgt:68in pid:577055593 ecl:grn byr:1996

               hcl:z cid:150 eyr:2039 byr:2015 pid:2453663020 ecl:brn
               hgt:154cm

               hcl:#efcc98 eyr:2022
               ecl:grn hgt:167cm byr:1978 iyr:2010 pid:180446111

               ecl:gry
               iyr:2020 hgt:152cm pid:#cce9cf eyr:2028
               byr:1942
               hcl:z

               hcl:#341e13 ecl:brn iyr:2019
               pid:589837530 cid:157 byr:1925 hgt:183cm eyr:2020

               byr:2009
               pid:179cm hgt:164cm
               iyr:1927 hcl:#cfa07d eyr:2034

               ecl:oth iyr:2012
               eyr:2028 hcl:#866857 pid:716964854
               byr:1940 cid:113 hgt:193cm

               byr:1985 iyr:2011 hcl:#866857 pid:454558712 eyr:2025 cid:301
               hgt:62in ecl:blu

               hcl:#733820 eyr:2025 ecl:amb
               pid:855788635 iyr:2016
               byr:1965
               cid:140 hgt:183cm

               hcl:#efcc98 cid:326 eyr:1961
               pid:001357810 iyr:1947 ecl:#8abfc8 hgt:75 byr:2012

               hgt:60cm pid:#e28da4 byr:2014 iyr:2019 eyr:2040 ecl:utc

               hcl:#733820 eyr:2022 pid:708208638 hgt:162cm cid:326 iyr:2018 ecl:oth byr:1997

               iyr:1967 byr:2013 pid:8595504787 hgt:73cm ecl:dne

               pid:808787977 hcl:#18171d
               cid:205 hgt:181cm
               byr:1986
               ecl:gry iyr:2013

               ecl:dne iyr:2009
               byr:2027
               hgt:188in hcl:#c0946f
               pid:585147305 eyr:2024

               hcl:#733820 iyr:2019
               eyr:2020
               hgt:190cm
               pid:042907748 ecl:grn byr:1920

               ecl:#603ad1
               eyr:2026
               hcl:33f9f8
               pid:862887360 hgt:156in byr:1993
               iyr:2013

               ecl:oth eyr:2030 byr:1960
               hcl:#a97842 cid:285
               hgt:60in pid:655974048 iyr:2016

               iyr:2030
               hgt:143
               pid:65806846 byr:1948 hcl:#72a0d3 eyr:1934 ecl:#7cd402

               hcl:z pid:#0f7c0a iyr:2012 hgt:161cm
               byr:2022 eyr:1937

               hcl:#fffffd ecl:hzl
               hgt:191cm byr:1935 iyr:2015 cid:240 eyr:2030 pid:778049989

               ecl:amb iyr:2011 hcl:#e196f6 pid:231470794 eyr:2026 hgt:179in byr:1979

               ecl:oth hcl:#6b5442 pid:181cm hgt:72cm
               eyr:2040 iyr:2010

               iyr:2016 eyr:2026 pid:113617276
               cid:117 hgt:176cm ecl:grn
               hcl:#c5b999

               iyr:2016 byr:1941
               pid:846760253 hgt:60cm
               hcl:#7d3b0c ecl:zzz
               eyr:1972

               eyr:2023 hcl:#623a2f
               cid:103 pid:476193829 hgt:181cm ecl:oth byr:1997
               iyr:2014

               ecl:#b64a07 hcl:7bb40c byr:2028 eyr:2039 pid:#e2ba33 hgt:189 iyr:1940

               pid:#3ecfd8 hcl:#7d3b0c iyr:2014 ecl:#30a5e7 hgt:73cm byr:1954

               ecl:dne
               byr:2011 pid:512088455
               hcl:#18171d eyr:2023
               iyr:2024

               byr:1996 eyr:2026 pid:268556486 ecl:brn
               hgt:150cm
               iyr:2013 hcl:#7d3b0c

               iyr:2014
               ecl:grn pid:222910621 hcl:#602927
               eyr:2030 hgt:155cm

               pid:530689228 byr:1938
               iyr:2015
               hgt:185cm ecl:hzl eyr:2022 hcl:#866857

               hcl:#b6652a byr:2028 iyr:2018 cid:150 ecl:lzr pid:706073193 hgt:169cm

               hgt:171cm ecl:gry hcl:#6b5442 byr:1953
               iyr:2011 pid:622763802 eyr:2026

               eyr:2032 hgt:137
               pid:5033763648
               byr:1925 ecl:hzl hcl:#623a2f iyr:2024

               byr:1930 pid:6999766453 ecl:#3e3e07
               hcl:#602927 iyr:2010 eyr:2039
               hgt:160cm

               hgt:122 ecl:amb pid:105302121 iyr:2017
               hcl:#733820
               eyr:2027 byr:1955

               hcl:#95f96b
               hgt:193cm iyr:2020 pid:719337690
               byr:1971
               ecl:brn eyr:2024
               """

    let day5 = """
               BBBFBFFRLR
               BFFFFFFRLL
               BFBBBBFLLL
               BBFBFFFRRR
               BBBFBFBRLR
               FBFFBBBLRL
               FBFFBFFRRL
               FFBBFFFRRL
               BBBFBFBLLL
               BBBBFFFLLR
               FBBFFBFRRR
               BFFFBBBLRR
               FFBBFFBRLR
               FFBFFBFRRL
               BBBBFBFRLL
               BBBBBFFLRL
               FFBBBFBRRR
               FFFBBBFLLR
               FFBFFBBLRL
               FBBFBBFLRL
               FFBBBBFRRR
               BFBFBFFRLL
               BBFBFFFLLL
               FFFBBBFRRL
               BBFFBFBRLL
               FBFBFBFLLL
               BBFFFFBLRR
               FFBBBFFRRL
               FFFBFBBLRL
               FBBFBBBLLL
               BBFBFFBRLR
               FBFBFBBRLL
               FFFBBFBLRL
               FFBFFBFLRR
               BBFBBBFRRL
               BBFBBFBLLR
               BBFBBBFRLL
               BFFBBBBRLR
               FBFBFBBRLR
               FBBBFFBRRR
               FBBBFBFLLR
               FFBFBBFLRL
               BFBFBFBRLL
               BFFFBFBLRR
               FFBBBFBRLR
               BBFBFFBLRR
               BFFFFBBLLL
               BFFFFBFLLR
               FBFBBBBRLR
               BBFFBBFLRL
               BFBFFBBRLR
               FFFBFBFRLL
               BFFFBBFRRL
               BBFBFBFRLL
               BFBFFFFRRL
               FFBFBBBRLR
               FBBFFFFLRR
               FBFBBFBRLR
               BBFFBFFLRR
               BBBFFBFLRR
               BFFFFFBRLR
               FBBFFFBRRL
               BFFFBBFRRR
               BBBFBFBRLL
               BFBBFBBRLR
               BFBFBFBLLL
               BBBFFFFRLL
               BFFFFBFRLL
               FFBBFFBLLL
               FBFFBBFRRL
               FFBBFBFRLR
               FFBFFFFRLR
               BFBBBFBLLL
               FBBFFBFRRL
               FBFBFFFLRR
               BFFBBBFLRR
               FBBFBBBRLL
               FFBFBBFLLR
               FFFBFFBRLR
               BBFBBFFRRR
               BFBBBFFLLL
               BFBBFBBRRR
               BBFFFBBLLR
               BBFBFFBLLR
               BFFBBFFRRL
               FFFBBFBRRR
               BBFBBFFLLR
               BFFBBBBRLL
               BFFBBFFRLR
               FFFBFBFLRL
               FBFFBBFLLR
               BFBBFBFRRL
               BFBFFFBRLL
               FBBFBFFLRR
               FFBFBBFLLL
               BFBBFBBRRL
               FBBBFFFLRR
               BBBFBBFRRL
               BBFBBBFRRR
               BFFBFFFLRL
               BFBFBBFRRL
               FFBBFFFLLR
               FBFFFFBLLL
               BFBBBBFRLR
               FFBFBFBRLL
               FBFFFBFLRL
               FFBFBFFLLL
               FBBBFFBRLL
               FBBBBBFLLR
               FFBFBBBLLL
               BFFBBBBLLL
               BFFBBBFRLL
               FBFFFFBLRL
               BFBFFBFRRR
               FFBFFFFRLL
               BBFBBFFRRL
               BBFBFBBLLL
               FFBBBBBRRR
               BBBFFFBLRL
               FBFBBBFRLL
               BFBFFFBRRL
               FFBFBBBRLL
               FBBBFBFLLL
               FBFBFFBLRL
               FBBBFFFLRL
               FBBBFBBRRL
               FBBFFBBRRR
               FFBFFBBRRR
               FBFFFFFLLL
               FFBBBFFRLL
               FBBFFFBRRR
               BFBBBFBRRR
               FFBFFBBRRL
               FFFBFBFLLR
               FBBFBFBRLL
               FBFFBFFRLR
               BFBBFFBLRR
               FFBFBBBLRR
               FFBFBBFLRR
               BFFFBFFLRL
               BBFFFBBRLL
               FFFBBFFLRL
               BBFBBFFLLL
               BFFBFFBRLR
               BBBFFBFRRR
               FBFFBFBRLL
               FBBBFFBLLR
               FFFBBFFLRR
               FFFBBFBLLL
               FBFBFBBLLR
               FBBBFBFRLR
               BFBBBFBLRL
               FBFBFFBLLL
               FBFBBFBRRR
               BFFBBBBRRR
               BFFFBFBLLR
               FFFBFBBRRL
               BBBBFBBLLL
               FBFFBFBLRR
               BFFFFFFLLL
               FFBFBFBRLR
               FBBBFFFLLR
               BBBFFFBLRR
               FBFFFFBRRL
               FBFFFFBRLR
               FBFFBBBLRR
               BBFBFBFRRL
               BFFFBFBRLL
               FBFBBFFRRR
               BFFFFFFRLR
               BFBBBBBLLR
               FBBBBFBLRR
               FBBFBBFRLR
               BBFBBBFLRR
               FBFFFBBLRR
               BBBBFFFRLL
               BFBFFBBRRR
               FBFFFBBLLR
               FFBBBFFRLR
               FBBFFFBRLL
               FBBFFBBRRL
               BFFFFFFLLR
               BBFBFBBRRL
               FBFFFBFRRL
               BBBBFFFLRL
               FFBFFBBLRR
               FBFFFFFRLL
               BFFFFBFRRR
               FFBFFFBRRR
               FBFBBFBRRL
               FFBFBFBLRR
               BBFBFFFRLR
               BBFFBBBRRR
               BBFFFBFLRL
               FBBBBBFLRL
               FBBBFFBRLR
               FBBFBBBLLR
               FFBFBBFRLR
               BFFBFBBLRL
               BBBFBFBLRL
               BFFBBFBRLR
               BFFFFFBRRL
               FBBFFBBLRR
               BFBBBBFRRL
               BBBBFFFRLR
               BFFFFFBLLR
               BBBBFBFRRR
               BFFBFBBRLR
               BFBFBFFLRL
               BBFFBBBRLR
               BBFFFBFLLR
               FFBFFBFLLL
               BBFFFFFRRR
               BBFBFFFLLR
               BFBFFFFLRR
               FBFBFBBRRL
               FBFFFFFRLR
               BBBBFFBLLL
               BBFFFBBLRR
               FFBBBBBRLL
               FBFFFFFLRR
               BFFFBBFLRL
               FBBBBFBLLL
               FBFBBFFLLL
               BBFFFBBRLR
               FFFBFFBRRR
               BBFFBBBRLL
               BFBFFBBLLR
               FFFBBBBRRL
               BFFFFBFLLL
               FBBFBBBRRR
               BFBBFBBLLL
               BFBFBBFLRL
               FBFFBFFRRR
               FBBFFFFRLL
               FBBBFBFRRR
               BBBFBFFLRR
               BBFFBBBLRR
               FFBBFBBRRR
               BFBBBFBLLR
               BBFBFFBRLL
               FFBBFBBRLL
               FFBBBFFLRL
               BBFBBBBRRR
               FFFBFFFLRR
               BFBBBFBRLL
               FFBBFBBLLR
               BFBFBFFLRR
               BBBBFBBRRL
               FBBFFBFLLR
               BFBBBFFRLL
               BBBFFBBLLL
               BFBFFBBLRR
               FBFFBBBRLR
               FBBFBFBRRL
               FBFBBBFRRR
               FBFFFBBRLR
               BBFFFFFLRR
               BBBBFFBRLL
               BFFBFFFRRR
               FFBFBFFLRR
               FFFBFBFRLR
               BFFFBBFRLL
               FFBFBBBRRR
               BFFFFBBRLR
               BBBFFFFRRL
               FBFBFBFRRR
               FBBBBFBRLR
               FBFBBBFRLR
               BBBBFFFLRR
               BFFBFFFRLR
               BFFFBBBLLL
               BFBBFFBRLR
               BFBFFBFLLL
               BFBFBBFRLL
               BFFBBFBLLL
               BFBBFFFRLL
               FFBBFFBLRL
               BBBBFFBRRL
               FBBBFFBLRR
               FFBBBBBLLR
               FBFFFBFLLR
               BBFFBFFRRL
               BFBFBBBLLL
               FBBBBFBRRL
               FBFBBBBRRR
               BBFBBFBRRR
               FBFBFFFRLL
               BFBFFBFLRL
               BFBFFBBLRL
               FFBFBFFRLR
               BFBBFBBRLL
               FBBBBBBRLR
               BBFBBBBLRL
               FFBBFBFLLL
               FFBBFBBLLL
               FFFBBFBRLR
               BBBBFBFLLL
               FBFBFFBLRR
               FFBBFFFLRL
               BBFBFFFRLL
               FBFFFBFRLL
               BBBFBBFLLL
               FFBBFFBLRR
               BBBBFBFLRR
               FBFFFFFRRL
               BFBFFBFRLR
               FBFBFFBRLR
               FBBFBBFRLL
               BFFFFFFLRR
               BBBFFFFLLL
               FFFBBFFRLR
               FFBBFFFRLR
               BBBFFBBRRL
               FBBFBFBLRL
               BFFFBBBLRL
               FBBFBBBRLR
               BFBFFFBLLL
               FBFFFBBLRL
               FBFFBFFRLL
               BFBFBFBLLR
               BBFFBFBRLR
               BBFFFFBRLR
               FFFFBBBRRR
               FFBBBBBLLL
               BBFBBBBRRL
               BBBBBFFLLR
               FFFBFFFRLL
               BFFBBFFLRR
               BFFBBFFLRL
               BBBFFBFRLL
               FFBFBFBLLL
               BFBBBBBLLL
               FFBBBBFLRL
               FBFFBBFLRL
               BBFFFFBLRL
               BBBFBBBRLL
               BFBFFFBLLR
               BFBFBFBRLR
               BFBBFFFRRR
               BFFBFBFLLL
               FBBFBFBLLR
               FBFBFBFLRR
               FFBFFBFLLR
               FFBFFFBLLL
               FBFFBFFLRL
               FFBBFBFLLR
               BFFFBFFLRR
               BBFFFBFRLL
               FBFBBBFLRR
               FFBBFFFLRR
               FBBBFBBLLL
               BFFBFBFRLR
               FFBFBBBLLR
               BBBFFBFLLR
               BFBFFFBLRL
               BFFBBFFLLL
               FBFBFFFRRL
               BFFBBBBLLR
               FFBBBFFLLR
               BBFFBBFRRL
               FFBFFBFLRL
               BBFFBFBRRL
               BFBBBFFLRR
               BFFBFBBRRR
               FBBFBBBLRL
               FFBFBFFRRR
               BBFBFFFLRL
               BBBFFBBLRR
               FBBFBFBLRR
               BFBBBBFLRL
               FBFFFBBRRL
               BFFFFBFLRR
               BBFFBBFRLL
               BFFBFBBLRR
               FBBBBFFRLL
               BFBFFFFLRL
               FBBBBBBLLL
               BFBBBBFRLL
               BFBFFFFLLL
               FFBBBFBLRL
               BBFFFFBLLL
               BFBBFBFLRR
               FFFFBBBRRL
               BFFBFBBLLL
               FFBBFFFRLL
               BFFFBFBRRR
               FBBBFBBRRR
               BBFBBFBLRR
               BFFBFFBLRL
               BBFFFBBLRL
               BFFBBBFRRR
               FFBFFBBRLR
               BFFBFBFLLR
               BFFBBFFRLL
               FBBFBFBRLR
               BFFFFFBLRR
               BFBFFBFRRL
               BFBBFFBLLL
               FBFFFFBRRR
               BBFFBFFLLL
               FBBBBBBLLR
               BFFFFFBRRR
               BFBFBFFRRR
               BBFFBFFRLR
               FBBBFFBLLL
               BFBFBBFLLL
               BFBFBBFRLR
               BBFFBFFLLR
               FBBFFFBLRR
               FBFFBBFLRR
               BFFFFBBLLR
               FFBFBFBLRL
               FFFBBBFRLL
               BFFBBFBRRR
               BFFBBBFRLR
               BBBBFFFRRR
               FBBBBFBLRL
               FBFFFFBLRR
               BFFFBBBRLL
               FBFBBFFRLR
               FFBBBBFLLR
               FFBFFBFRLR
               FFBBBBBRRL
               FBFFFFFLLR
               BFBBBFFLLR
               FBFFBBFRLL
               BBFFFBFRRL
               BBFFBFFLRL
               FBFBFFFLLL
               BBFFBFFRLL
               FFFBFFBLLL
               BBFBBFBLRL
               BBFFBFBLRL
               BFBFBFBRRL
               FBBBFBBLRR
               FBBBFBFLRL
               FBBBBFFRLR
               FFBFBFFLLR
               BFFFBFBRLR
               FBBFFBBRLR
               BBFFBBFRRR
               BBBFFBBRRR
               FFBFFFBRLR
               BBBBFFBLRR
               BBFBFBFLLL
               BBFFFBBLLL
               BFBBFFBLRL
               FBFBFBFRRL
               BBFBBBFLLR
               FBBBBBFRRL
               BFBFBFBLRR
               FBFBFFFRRR
               BFBFFBFLLR
               BBBFFBFRRL
               BBBFBFFLLL
               BFFFBFFRRR
               FFFBBBBLRR
               BFFBBFBLRR
               BFFBFBFLRL
               BBBBFFBLRL
               FBBFBBFRRR
               FFFBBBBLLL
               FBFFFBBRRR
               FBBBFFFLLL
               FFBBBBBRLR
               BFBFFFFRRR
               FBBFFFFRRR
               BBBFBFFLRL
               BFFFBFFRLR
               BFBFFFBLRR
               BFBBFBFRLR
               BBFFFFFRLR
               BFFFBBFLLL
               BBBFFFFLRL
               BBFFBBBLLL
               FBFFBFBRRL
               BFBBBBBRLR
               FBBFFFBLLL
               FBBBFBFLRR
               BBFBBBFLLL
               FFBFFBBLLR
               BFFFBBFLRR
               BBBBFFBRRR
               BBFFFFBRRL
               FBFFFBFLLL
               BBFFBBFLLL
               BFFFFFFRRL
               FBBFFBBRLL
               FFBBFBFRRL
               BBBFFBBRLL
               BFBFBBFRRR
               FFBFFFBLRL
               BFFFFBBRRR
               FFFBBFBRRL
               BBBFFBFLRL
               BFFBBFBLLR
               FFFBFFBLRL
               FBBBFBBRLL
               BFBBFBBLLR
               FBBFFFFLLR
               FFBFBFBRRL
               FBBFFBBLLL
               BBBBFFFLLL
               FBBBBBBLRR
               FFFBBBBRLR
               FBBBBFFRRL
               BBFFBBBRRL
               FBBFFFFRLR
               FFBFBFFLRL
               FBFFFBFRRR
               FBBFBBFLLR
               FBBBBBFLLL
               FFBFBFFRLL
               FFBFFFFLRR
               FFBBBBFLRR
               FFFBFBBLLR
               BBBFBFBLRR
               FFBBFBBRLR
               FBFFFFBLLR
               BBFBFBBRLR
               FBBFFFFLLL
               BBBBFBBLLR
               BFBBBBFRRR
               BBBFBFFRRR
               BFFBBBBLRL
               BBBFBBBRRR
               FBFFBFFLLL
               FFBFBFFRRL
               BBBBFFBRLR
               BFBBFFFRRL
               FFBFFFBRLL
               BBBBFBFLRL
               FBBBFBBLRL
               FFBBBFFLLL
               FFFBFFBLLR
               BFBBFBBLRR
               FFBFBBBLRL
               BFBBFFFLRR
               FFFBFFFLLR
               BFBBBBFLLR
               BFFBFBFRLL
               BFFBFBBRLL
               BBFBFFFLRR
               BBBFBBFLLR
               FBFBFFFLRL
               FBFFBFBLLL
               FFFBFFBLRR
               BFFFBFFRLL
               BBFFBBFLLR
               BBFFBBBLRL
               FBFBBBBLLL
               FBBFBBBLRR
               FBBBBBFLRR
               FBBBBBBLRL
               FBFBBFBLLL
               FFFBFFBRLL
               FBFBBFBLRR
               FBBFFBFRLR
               BBFFFFFRLL
               FFBBFBBRRL
               BFBFBBBRLL
               BBBFFFFLLR
               FBFFFBFRLR
               BFFFBFFLLL
               BBBFFFBRLL
               FBBBBFBLLR
               FBBFBFBLLL
               BBFBFBFLRR
               BFBFBFBLRL
               FBBBBBBRRL
               BFBFFFFRLL
               BBBFBBBLLL
               BFBFFFBRLR
               FFFBBBBRRR
               FFBFFFBRRL
               FBFBBBBLRL
               BBFBBFBRRL
               BBBFFBBLRL
               FBFBFBBLLL
               FBBBBBBRRR
               FFFBFBBRLR
               FBFFBFBRRR
               FFBBFBBLRL
               BBFBBBBLRR
               BFFFFFFRRR
               BBFFBFBLRR
               FFFBBBFLRR
               BBFFBBFLRR
               BFBFBFFRLR
               FBFBFFBRLL
               FFBFFFFLLL
               FBFBFFBLLR
               BFFFFBBLRR
               FBBBFFFRRR
               FFFBFFFRRL
               FBFBBBFRRL
               FBBFFFBLRL
               FBBBFFBRRL
               BBBFBBFLRR
               BFBBFBFRRR
               FFBFFBFRLL
               BBBFBBBRRL
               FBBFBFFLRL
               BBBFBFFRLL
               FFBBBFBLLL
               BFFFFFFLRL
               FFFBFFFLRL
               FBFBBFFLRL
               BFFBFBFLRR
               BBBFFFFRRR
               FBFBBBFLLL
               BFFBFBFRRL
               BFFFFBFRLR
               BFBBBFFLRL
               FBBBFBFRRL
               BFBBFBFLLR
               BFBFBBBLRR
               FFFBBBBLLR
               FBFBBBBLRR
               BFFBFFFLLR
               BBFBBFFLRR
               BBBBFBBRLR
               FFFBBFBLLR
               FFFBFBFLLL
               BBFBBFFLRL
               BFBBFFBRLL
               BFBFFFBRRR
               FFFBFBFLRR
               FFFBBFFRLL
               FFBBBBFRLL
               BFBBBFFRRR
               FBBFBBFRRL
               BBFBBBFRLR
               FBFBFBBLRL
               FBFBFFFLLR
               BFFFFBBRLL
               BFFFBBBRRR
               FBBFBFBRRR
               FBFBFBBLRR
               BFFBFFBLLL
               FFBFFFBLLR
               FBBBBBFRLL
               FFFBBBFRRR
               FFFBFFBRRL
               BBFBBBBLLL
               BBBBFBBLRL
               BBFFFFBRLL
               BFFFBBBRRL
               FBBBFBFRLL
               BFFBBFFRRR
               BFFFFFBLRL
               FBFBBFFLLR
               BFBBBFBRRL
               BBFBBFBRLR
               BBBBFBFLLR
               FBBBFBBRLR
               FBFBFBFLRL
               BBBFFBBRLR
               BBBBBFFLLL
               BFFBFBBRRL
               BBFFBBFRLR
               BFBBBBBLRR
               FFBFFBFRRR
               BFFFBBBLLR
               BFFFBFBRRL
               BFFFBFFLLR
               FBBFBBFLRR
               BBBFFFBRLR
               BBBBFBBRRR
               BFBFBFBRRR
               BBBFBBBLLR
               FBBFBFFRLL
               BBBFBBFRRR
               FFBFBBFRLL
               BFFBFFBRLL
               FBFBBFBLRL
               BBBFBFBRRR
               BFFFBBBRLR
               BFFBFBFRRR
               FFBFBFBRRR
               BFBFBBBRLR
               BBFFBFBLLR
               FFBFFFFRRR
               BFBBFFFLLL
               BFFFFBBLRL
               FBFFBFFLRR
               BFFBFFFRLL
               BBFBFFBRRL
               FBBFFBFLRL
               FBBFBFFLLL
               FBFFFBFLRR
               FBFBFFBRRR
               FBBBBFFLLL
               BFBFBBBRRR
               BBFBFBFLLR
               FFBBBFBRRL
               BBFBFFBLLL
               FBBBBFFRRR
               FFFBFBBLRR
               FFFBBBFRLR
               BBBFFFBRRL
               FFBBFBBLRR
               FFBBFBFRLL
               BBBFFFBRRR
               BBFBBFFRLL
               FBBFFBFLLL
               FBFBBFFRLL
               FFBBFBFRRR
               BBBBFFBLLR
               FBFFBBFLLL
               FBFBBFBLLR
               FFBBFFFRRR
               BBBFBBFRLL
               BFFBBFBRLL
               FBBBBBBRLL
               FBBFFFBRLR
               FFBBBBBLRL
               BFBBFBBLRL
               BBFBFBFRLR
               BFBFBBFLRR
               FFBFBBFRRR
               FFBFFFFLRL
               BBFBFFBRRR
               BBFBFBFLRL
               FFBFFBBRLL
               BBFFBFBLLL
               BBFFBBBLLR
               FBBFBFFLLR
               FBBBBFBRLL
               BBFFFFFLLL
               BBFBFFFRRL
               BBFFFBFRRR
               BBBFBFFLLR
               FFBBBFBLLR
               FBFBBBBLLR
               BBFFFFFRRL
               FBFBFBFRLR
               FFBFBBBRRL
               FFFBBFFRRL
               FFFBBBFLLL
               BFBFFFFRLR
               BFFBBBFRRL
               BFFFBBFLLR
               BFFBFFBRRL
               BBFBBBBRLL
               BBFBFBBRLL
               BBFBBBBRLR
               BFFFBBFRLR
               FBBFFBBLRL
               BBBBFBFRRL
               BFFBFFBRRR
               FFBBFFBLLR
               FFBBBBFRLR
               FBFFBBBLLR
               FFBBFFBRRL
               FBFBFFFRLR
               BFFBFFBLLR
               FBFFFBBLLL
               BFBBFFFLRL
               FFFBBFFRRR
               BFBBFFFRLR
               BFBFFBBRLL
               BBFFFFBRRR
               FBFFFFFLRL
               BFFBBBFLRL
               BFBBBFBLRR
               FFBFFBBLLL
               BFBFBBBRRL
               FBBBFBBLLR
               BFFFBFFRRL
               FBBFFBBLLR
               BBFFFFBLLR
               BFBBFBFRLL
               FBFBBBFLRL
               BFFBFFFLLL
               BBBBFBBRLL
               BBBFBBFRLR
               FBFFBBBRLL
               FBFBBBFLLR
               BFBBFFBRRL
               FBBFFFFLRL
               BFFBBBBRRL
               FBFBFBFRLL
               BFFBBBFLLR
               FBFBFFBRRL
               BBFBFBBRRR
               FFFFBBBRLR
               BBFFFBFRLR
               FBBBFFFRLR
               FBBBBFFLRR
               BBFFFBFLRR
               FBFBBFBRLL
               BBFFFBBRRL
               FFFBBBBLRL
               BBFBBFBRLL
               FBBBFFFRRL
               BFBFBBBLRL
               FFFBBBBRLL
               BBFFFFFLRL
               BBBBFBBLRR
               BFBBBBBRRR
               BBFFBFBRRR
               BFFFBFBLRL
               BFBFFBBLLL
               BBFFFFFLLR
               BFBBBFBRLR
               FBFFBFBLRL
               FFBFBFBLLR
               FBBFBBBRRL
               FBFBBBBRRL
               BFBFBFFLLL
               FBFFFFFRRR
               BBFBBBFLRL
               FFBFFFFRRL
               BBFBFFBLRL
               FFBFFFFLLR
               FBFFBBBLLL
               BBBBFBFRLR
               BBBFFBBLLR
               FFBBBBFLLL
               FBBBBFBRRR
               FBBBBBFRLR
               FFFBBBFLRL
               BBFFFBFLLL
               FBFFBFBRLR
               FFBBFBFLRL
               FFFBBFFLLR
               FFFBFFFRLR
               BFBFFBBRRL
               BBFFBFFRRR
               FFFBFBBRRR
               BFBFBFFLLR
               FBBBFFBLRL
               FFBBBBFRRL
               BBFBFBBLRR
               FFBBFFBRRR
               BFBBBBFLRR
               BFFBBBBLRR
               FBBBBFFLRL
               FBBFFFFRRL
               FFBBFBFLRR
               FFBBBFBRLL
               FFFBFBFRRL
               FFBBFFFLLL
               FBBFBFFRRL
               BBFFFBBRRR
               BBBFFBFRLR
               BFBFFBFRLL
               FBBFFFBLLR
               BFBBBBBRRL
               BFBBFBFLLL
               BBBFBFBRRL
               FBFFFBBRLL
               FBBFBFFRLR
               BFFBBBFLLL
               FFFBFBBRLL
               BBBBFFFRRL
               FBFBBFFLRR
               BFFFFBBRRL
               BBFBBFFRLR
               FBFFBFFLLR
               BBBFFBFLLL
               BFBBBBBLRL
               BFFFBFBLLL
               BFBFBBBLLR
               BBBFFFFLRR
               FBBBBBFRRR
               FBBFBFFRRR
               BBFBFBFRRR
               FFFBFFFLLL
               FBFFBBBRRL
               BBFBBBBLLR
               FBFBFBBRRR
               FFFBFBBLLL
               FFBBBFFRRR
               BBBFFFFRLR
               BFBFFFFLLR
               FBFFFFBRLL
               FBBFFBFLRR
               BFFBFFFRRL
               BBFBFBBLRL
               FFFBBFFLLL
               BFBBFFBRRR
               FFBBBBBLRR
               BBBFFFBLLL
               FFBFFFBLRR
               FFFBFBFRRR
               FFFBBFBLRR
               FBFFBBFRLR
               BFBBFFFLLR
               BFFBFFBLRR
               FBFFBBFRRR
               FFBBFFBRLL
               FBFBFBFLLR
               FBBFBBFLLL
               BFBBBBBRLL
               FBFFBFBLLR
               BFBBFBFLRL
               BFBBBFFRRL
               BBBFBFFRRL
               FFBBBFFLRR
               FBBBFFFRLL
               FFFBBFBRLL
               BFFBBFBRRL
               BFBFBBFLLR
               FFBFBBFRRL
               FBBBBFFLLR
               FFFBFFFRRR
               BBBFFFBLLR
               BBBFBBBLRR
               BBFBBFBLLL
               FFBBBFBLRR
               BFBFFBFLRR
               BFFBBFBLRL
               BFBBFFBLLR
               FBFFBBBRRR
               BBBFBBFLRL
               BFBFBFFRRL
               BBBFBBBLRL
               FBFBBBBRLL
               BFFFFBFRRL
               BFFFFFBRLL
               BFFFFBFLRL
               FBBFFBFRLL
               BBBFBFBLLR
               BBBFBBBRLR
               BFFBFFFLRR
               BFFBFBBLLR
               FBFBBFFRRL
               BBFBFBBLLR
               BFFFFFBLLL
               BFFBBFFLLR
               """.textFileToListOfStrings()

    let day6 = """
               cady
               ipldcyf
               xybgcd
               gcdy
               dygbc

               rwhvugmspoyzfbnlcxqtdj
               avqdpntxrclufbjswgzh
               qbvwgzpfsrjtdxnculh
               jhrpclwdxgqibfsntzuv

               gxqezucvaowipbsdr
               zvoqciegxabwudrps
               gecawpxvdrqzioubs

               vlta
               tavl
               latv

               znjwr
               grzynwjdpe
               jnrwz

               mldxjabiuckefzrhywogtq
               hgflyratmezidxowc
               gwiavxlrstzfchymoed
               oyedcrlfmawhxvzgit

               kl
               kql
               kl
               lk
               lk

               anf
               fan
               zanf
               fnae
               zafn

               bwfxjsmovghz
               ojibsmhxg
               mxhgjobs
               bjgxhosm
               xbmsjpoheg

               tvujfaqxkpirgbnyde
               xbmtadenhqwpcjl
               dcxezoptnlajwqb

               sxcvq
               rxqckvas
               idsvlyczqtxo
               cqeujvxs
               vacqfpxksg

               ujek
               eukj
               kzxejdg
               ekrjfyw

               rhosjkf
               ajfhekrs
               yrdkjshvcfo
               sryvfjkph

               l
               p
               l

               nbrmvjxdy
               trhcxfjdegby
               xrbdjoqy
               ubjydrxmpk
               rbwjxsdyv

               xygocl
               lygoxc
               ygxocl
               olcgxy

               pai
               ipyw
               biuvxdlsrz

               h
               g
               yh

               rgib
               zathbrm
               rthkbx
               frbsnpeqyov

               encvxrbdfawzqs
               sdknfaquybvw

               dtckazwsxrlhjeyi
               exoahjrikulpztwfc
               joilqaxewktrchz

               keyspo
               skyeop
               okeyps
               pekaoygs

               lgxwytzvbhauemdir
               yevalwdbpgzutimrxhq
               maileyhvrubwxtdzgq
               tmbjeghxlywzsudvira
               dievrwylagbtmhuxz

               xnlfbjqdoyp
               olbrjxypfq
               jsxylqfpbo

               exwdrgyn
               rtwldyng
               mcbkdpqsyaionghfwr
               nygrdw
               ndrwvygzj

               rywk
               lhkewboru
               pkirwn
               sgcrwipk

               bkdinatzpvwr
               vephqsjxrktznbaw
               wznkprbtvia
               nligrkupyzwtdavb
               btziarpkngvw

               us
               nsue
               cuso

               xkjgnv
               ckgvqjnxs

               bagwlk
               lfvkwg

               vgheapjblkfmztyxd
               fhtqpdulcabjgemynkz
               jbohsempzdfiakgylt

               k
               v
               kd
               d

               xdfinmksvbzyagj
               dsyokf
               dyshufk
               pstdwqyfkh
               odcksrfy

               ktjrhcmxegi
               hcgiexktrjm
               jthcegmrxik

               gmk
               kgm
               gkm

               sfetmaqgdlzbwxpcvyhoij
               tynliwkhdjqexpafm
               maqyjwixfphlentd
               hmifurwajteyxdlqp

               hkl
               hlk

               qjkgenvtlrduy
               mxwcbhvsifpzoa

               lmqnek
               ikle
               olek

               btcnlxuh
               uchlntbx
               cnbtluxh

               kuwciyjznd
               dwjyunzkci
               iuzykjnwdc
               zdcwjuyikn
               wujzdcknyi

               kmygjferih
               gewjmsykcqfrhxiv
               fjrmkydghei
               hjykfemgri

               ktldfrcqpvgzisbjnoe
               ladoibuscgntqekzpfvj
               vejibocqgztnkpldsf

               fahlzrqjxv
               rlhjvqx
               rioltxqjhs

               tzdewcosbi
               mwtsbezdick
               iswotzevdcb
               ecvdszbtiw

               qyuowsetikpar
               ytwgp
               ptdxywv
               wytp
               txlgypw

               irjbhysqofx
               ckdvuonfxgtl
               yfewoarzhjmxs

               widzueoshfvxpy
               vzuyihefspdxw
               ayvpfqizxshwude

               dfgztxy
               uztxf
               nofctkqv

               ao
               naolp
               oa
               oa
               oa

               dpwfujoxvnktl
               vekbhcyjdu

               en
               n
               n
               n

               jquynzapovkgdhc
               gopazyucqhkdnjv
               cpohvgkjuanqydz
               kycduqpghsnozajv

               itawoxecv
               avxtcwenio
               xebicyvtuhwog

               iqovjtwyhanelbg
               lwvjtionhgyqbae
               evjoquglnwhyaitb
               ntjilwyoaqvehgb

               sqivjzpmkorlbwh
               pmjvhkqbrzwosil
               vkoiqmdbrlhpzwsj
               mucljwzsvrkhpqiboe
               vwjmqhobzskpilr

               tprevw
               prte
               rhwkpt
               fmroidptaj

               wablxvpqz
               byexlwv

               tcqsyohw
               ohqwcsyt
               ctyehowsq
               whcqstoy
               qtohswcy

               pz
               pixaz
               pzd
               pz

               nwuikyve
               nyvewkiu
               iyvkwunez
               vkniyewu
               wuivnkye

               eytdnkbazpmwg
               mgbtacdwkyenp
               geyptwduabnzmkh
               teswyamrxbknpjg
               tkbcywpengma

               mjxavd
               gyutzrfal

               fvcizraqbesujko
               uienrftwaylzdc

               uincmblfertod
               qdoktbjlnvzehrxgspy

               jvcqkryilgpwfntxums
               xirbvakwlsfjycqn
               rysiawecnlxkvqfjzhd
               rvxycqlinhjswkfo

               mdvnkegyacoru
               wicopyauvghfnredstmk
               cenomkayrudvgz
               vnagokzyrdemcu
               uqynearvkcdomjg

               ly
               ysl

               vpictsgwzxm
               trgwsxvzci

               qdkcbwhn
               ncbrkhdqw

               sixgyadetw
               vmdiwknxfh
               dgwxiyura
               qeuwgizxdp
               lrpwocdbiajx

               vnwysrfutb
               fbnrytuvs
               orbivfdypstlun
               bvnurtfys

               sgkoh
               hokgs

               mqouzflbs
               lmzsyo
               lmszixyo

               mkzp
               mzkp
               umzpk
               pkzm

               ulpj
               jpul

               gelws
               sple
               tsqekvolbczxan

               grhebl
               gblreh
               bgherl
               behglr

               fevslgjktqazhorycpxw
               lcmukypbsoxedvf
               xosyfvpckenli

               jxyiconfuzmbsaevtwhldrp
               xmefakdwocsrzbnivhtl
               wgznhsqfvtbcxamleiord

               hdtjrpawu
               sjraptcdhwu
               ptrwajdhu
               twadpjrhu
               rpaudwthj

               motjpfylnx
               fnoyjpmlx
               ofplnxjmqy

               anhjilfkyrmxzvceub
               eadlxybhfvcjinwzmrkou
               pxksjvnmylraicghzftbe
               dkyzimvbcjxraelhnf
               yivnzebljhxfkrcma

               gut
               tgu
               utg

               nzrbtjvdm
               jdtvbmznr
               znjrmtvdb
               dmvnrbztj
               bdjzntmvyr

               jwszypbxieafrdnch
               aschejbznfx

               xochndwqpvzmyguflkbtrsaeij
               xfhqyitrlcnewsjzvdpakgombu

               eks
               kep
               ek
               ek
               ke

               xulgsdaeicz
               pntklwzvb

               zqrma
               cxzaikm
               atywgdmuvsnl

               lwzxqithm
               ovgsp

               arozwi
               aiwqz
               iwgkbz
               iucwzdxps

               frbyoen
               ovyfenc
               seyhioxwztk
               enuogly
               qomye

               rvxnqd
               vdqrny
               mrnlqvd
               szvqrnbdx
               vdrqoguhain

               xowaq
               wqovn
               bmghtco
               okar

               nflvbdqgrjsko
               rgbjndlosfvkq
               ndklgqovrbfxjs
               svkeqbjflordgn

               m
               ao
               wu
               s
               a

               wkrfzvohsylcdegiq
               fhwxcqlsoizk
               qflzcwjhsoik
               wiqlhoxcfskz
               wclhtnspioamzfqk

               ldtackmr
               pxestymrz
               yrwtmup
               gmqvnrjfit

               t
               t
               bph

               nywitsj
               tqvrlnwhgs
               mtaidusnywxk

               gxcyd
               cdxgyf
               kxycg

               il
               l
               lb

               guna
               nufa
               anuqvrj

               eoulsfcqmnrvjgxiat
               tlargoxfvisumecjkqn
               rjgnseatxoivqlcfum
               suvlciaxrtngqmehofj

               glkcfvztmsqdb
               sjdowcmxtvlzqbg
               tpryhgedzcumbasl

               taumpvcels
               tvsuepcalm
               pveumsatlc
               masvuletcp

               z
               z
               yz
               z
               z

               mp
               pm
               mp
               mp
               pm

               xwckdmsnh
               kwsxviun

               iuzmajtxolf
               awfmvjuoilxzte
               ztfmixyoqrljua

               sjgeqy
               yzxnmri
               ykdmixrv

               cm
               m

               awnvypxbcdl
               cnpydlxawb
               dcpxylbanw
               xnydlbcwap
               bdxpncwlay

               uj
               xhfu

               zrsiauqehwb
               ceqwsbai

               l
               l
               lp
               l
               lv

               azuxqnhyecdslbojwf
               nyxzefuasjbolwqc
               wlgzqjxvtfpuoebycmnkasi

               ckuziyfdetswr
               yezwutficsdk
               sykftuwcezid

               spdvxqwk
               pdvksx
               sdpkvx

               v
               azp
               c
               ci
               c

               gf
               lv
               k
               k
               lv

               dvnxstyjharkqgfcpzoebml
               brhaizuseyjpmgotdvkxcfq
               xomkprgcdfbwjystazeqvh

               rehopfalvz
               imhjprwqyzeo
               zstpundkbcgx

               ewilz
               lziew
               welzi
               lzeiw

               qxthsijdgcywpnk
               dsnptchxqjwy

               ukbjit
               bjuit
               uibzjtnxm
               ibjtu
               ibpujt

               chokmipvwlfryztenqxu
               iuxefydlatrphvznokq
               tdxkivblonrezsqyuhfp
               qnultkpixrvzfeoyh
               kutqzydxnvjohriplfe

               ksilczxfgabryuj
               nqyfczjhdoxsleuagbki
               bpfcseykgjzaxluih
               kcsfiubjvtxazgmwyl

               ircxknguzj
               icznmrugxjk
               jknciurgzx
               zckrijnxgu
               jxgrczknui

               fhslg
               rleopshnu
               hsflg

               etsigcxpofakmq
               aqskpecgitfyxhomn
               kfxpqgaoceismt
               qxpmikgaseftco

               wb
               wb
               ab

               i
               szivqg
               im
               i
               i

               jnq
               j

               sy
               ys
               asuy
               ys
               vyis

               upvcjtqwergyib
               bjhn
               bfdj
               jb
               bahj

               yiclqgj
               qlcjxgiy
               qgyljic
               qiyjglc
               ycqjilg

               uitoacvrg
               bithcfgyosevr
               rvocgmitn
               itcjngovr

               epbwxvdz
               ldvx
               dxvn
               vdx
               vdx

               jatsqkxuhdrpbecnylvmfzigw
               lxemqiyfwbskonhptjdzurcagv
               ifwpcvjzkmhuqbsnyatdrxgel

               w
               w
               w
               w
               w

               z
               e

               pmr
               b
               ju
               be
               eb

               gw
               gw
               gw

               dbizovcyxmusfwae
               gjrhpklqt

               msi
               s
               s
               s

               meykd
               wyhmb
               yxm
               dyxomt

               dxjyuwfelbnsqzc
               otiaxcwfeqdgnjuz
               jzxnrcdquvefw
               czfwmjuqkxden

               svour
               rvuwso
               ourbsvj

               ubil
               u
               u
               du

               uqtadhzrnxcvspl
               mkefnjsoxy
               msnigx

               tb
               pbt
               rbt

               lpdrxvuaqgjzmshwkntoibfy
               whmlbyrukqjzpagvofcdenxst

               muviezfdk
               qukvfyeisr
               ikuyfs
               tgljkihfwauc

               airkzuthfwsgepj
               jqcsowhuxratfgkp

               kwqiftygb
               bqcgk
               bgcklaq
               kvaqbg
               sqbkgl

               aoqnmrfg
               daqmgnf
               mfgaqnu
               wmpahinkgjqbe

               mwreujqsnibvzg
               mweizqrujbnvsg
               jnzrbgsvmiqewu

               vztidxa
               azdtxiv

               hrxmwsuig
               mhigxsurw
               usrhxigmw

               cfebnouykgx
               koxsucqgyraf
               juktchzofvyipxwgdlm

               hx
               xh
               hx
               hx
               hx

               mduw
               wmdnpu
               mduw
               dwum

               wutmabgchq
               uazbkx

               pjbyczfgslqen
               znekrqpjwsclyigfb
               jypsgxaqfznlebc
               bpcfqeltsynzjg

               tsxublnfe
               lrtfspbn

               izolf
               iofz
               xuqfiny

               o
               lom

               ojzmfxhikdcypueg
               pvxcfmoyguejkqr
               spweltkufjvgoymcx
               mkucjyesbogxp
               ecmpynakxjguo

               zdouqevfi
               rnqzpoufv
               hvumclzqbosywafgx
               fjutvokzq

               pkvghyjfrdu
               vfghyjdr
               lvgjyhbidaftroc
               hfedvjyqrg

               jxiuzblvkmyegsnofq
               nlbmquvyzjdpfxgseiwc
               mjbgehyqkxlvzfntiusr

               aczfpmyuwstqbjhednxlo
               yecdxblpfmanzwsuojthq
               bsjxzityancldmquefwhpo

               lvnyfcu
               vxcylfq
               tvqkylcu
               vblscjyf
               dlcmyrwoapviez

               wberan
               ouzcxydhn

               bvpzg
               pvzb

               lbmnpuiyctxrevsdhfkjz
               enlkmziauvcbftydrpxshj
               oxnlhmsdzjriuftckeybpv

               t
               r

               bfhgolnuptvjsxym
               amlwuokyvbitjfghsnrc
               yvfgmlehjbxnotsu

               ckqgw
               qgvkwc
               wmgckq
               kgwcq
               qwkgc

               cnpedr
               pevnc
               nbcpt

               grkun
               kgpnur
               nugkr
               rnkgu

               somqp
               pouqma
               compqy

               ruqhzxb
               qbhru
               qbrhuj

               mtukhzvjlcpbsao
               luvynbjqerifzwoxgph

               rqjikzu
               pgbnltefkj

               nomhpazbfcuyktxqiwgl
               ezymcifpgwxabqnoth
               jfitzgwocnpqyabmhx

               tapvqkdegyfxhucjinmb
               ujratdgqmphkfxyivbn
               dtyxkgqjvbhimfnaup

               notivlm
               omilvnt
               ioltnvm
               vitomnl

               bzipxlfwqocrev
               ezqnpmioytdbfr
               zrpfoqubesi

               kmaplbsjvdchxwyn
               nycxswbhajdpk
               pnkjuwdyscaxhb

               sabngehtj
               aetjghs
               aetxhsogj

               xazifjcsrhqvotnwbuyke
               sanqejbycdwifrxvhzp

               psqc
               pmq
               rjqvygzka

               zx
               z
               z
               zq
               z

               tcfsxal
               olcfxas
               ctxslaf
               afcxsl

               yofme
               omfe
               yfoem
               umfeozjv

               s
               s
               bsk

               ipwujhmlxfqedtgkasvbrozc
               eacjpdkwqhugtvlbsifrozm
               hdjqmcalsefbpizokruvtw
               sqzcmptjwvkfaehnolbrdui
               zubmdsipaltehvcjkfrwoq

               q
               w

               mgtouezsxpqakjnl
               avomlkdet
               cmitdakloe
               kyafiltewmo
               dhmelcbtoawk

               weqysz
               wvuqybse
               sqexlw

               grohujnmf
               jowaptgxryb

               vmankdpz
               ezaxt

               adkxmvpjgnswzy
               gxmndzkryjapsvw

               lmoqnvsfaxuhd
               couflmndvqhsja
               nrdsoavbhfqumi

               nopql
               mqlopn
               lqonp
               plnoq
               olqpn

               rndkilzmstjeg
               imnerzgtlkjs
               ilkgrtndmzesj
               jgzmtlrikens
               oplrmkcgzeisntvj

               wkveobq
               vbmwyez
               jtixfdplug

               fkog
               xgnvprf
               gwfot
               fqtg
               kfgj

               rmkbpqiczyatsue
               arbkqwtihsnepzuyl
               itsdgzekyuajopqrbvf

               tsogfdjmiweuplryc
               entpjmiwkbydcusgq
               ytwcdugmsikejp

               gtifu
               fgut
               maugfqt

               lydezqgconibxhptr
               rvhpziextcgqdn

               lomz
               ote
               horj

               xeljfmtougnbavpdrcqw
               lxporgjacuebvtsfqdn
               cxbzydvfqplijngrtuoahk
               dcbfxjownqtpagvulr

               sdgt
               gtsd
               tsdgr
               dtgs
               dgst

               odwjlyk
               yc
               bgrhvyniq
               pykje
               ykflz

               dgsx
               xsdg
               dxsg
               gdsx

               wtp
               wpiyl
               qxev

               rtionqlhjx
               zroknluimtqbxc
               rtxqhoinl

               yntd
               ndt
               ntd
               dtn
               mfdqtn

               qbrakwdnmcjifxtogy
               pygfcekrmxjqod
               kycfolmdqrgxj
               qkymfxodjrcg
               xcmkofrjgdyq

               pwyamsuvxo
               ymxvapuows
               zsxmupayowv
               wsymavxupo

               vwhqylbkdjcorgm
               gwydlkobqcvjr
               jqwpboghlvdcak
               xjbnqwvedzkglo

               oncquyf
               qnfaowr
               ncqfo

               tvdqhwca
               plxmrjeou
               zfb
               gsznyie

               a
               a
               a
               a

               esoucni
               uzfgwcnxaqstbmev
               cheyisjun

               jnaqvhfpoxcue
               epncvjuxfbdha

               zji
               zji
               ojiz
               izj

               pdysemnc
               emsdnycp
               sadecvmynp
               mdnpjcsewy

               coexuhlafgsqtb
               geslfaxutqho

               vknhzpqwifxelbaoy
               ihgbkjqavroyzswme

               lo
               omu
               roscv

               bnus
               bsun
               subn

               zolprckqstjga
               qcsgkztrojw
               rgkejwqcstomz
               sgqjbkcroyzt
               twqgksozjrc

               pwfuqsjl
               pqwijlzfbush
               slwpjqfau

               rsnhwkvleyq
               ynwrvehsklq
               sqlvnwkreyh
               qulweyrvhksnboj
               hvwnelyqcakrs

               pchq
               pcq
               pcq

               emibouksdlwzy
               nzfvuaim

               xmopwqrt
               umxwteynq

               hvl
               hv

               kpslmgyoxfnvwdzue
               gufhxmrjkeovsydilqw

               fntkuxiag
               txinagfuk
               kintafuxg
               xufitgnka

               gsenjvq
               eqmgjv
               qbgjuev
               mjqgev
               qvejgs

               sdkecjiawgvmltuz
               bqlmsrpfitcndyz

               txbwf
               zmpxlvbqoa
               uhxiseydcnjkg

               tflsahkdqbuz
               afqhucrkzstdbnl
               htlaeusgzxdfikqb

               exnkiu
               xeitkun
               uexkni
               kinxeu

               fnkx
               knf
               fkin
               cfnk

               h
               h
               h

               hplu
               lgu
               wmiq

               aithpkcvxerjlygbos
               xaisprobejchkyvqg
               gxskbwcpfyraejhoiv
               brapkfieyvjgocsxh

               diowj
               hcbql

               fzgmaib
               gzfrlipdh
               vgzjbifcx
               tjgwzfi

               j
               xh
               g
               t
               yv

               jokizbras
               asizobkjr

               zjveuyai
               yajeivuz
               juzyeiva

               sxogndybtrkam
               nyfwkdxa

               ie
               ei
               ie
               ei
               ei

               oztsejp
               stzoepj

               cvoutkrjs
               rstjcakxoule
               sucomjtrk

               kgsquajhnwydi
               myqeihnwztd
               fwnxpyheridq
               vywnzodihq

               thrqlasxkwvgonmbid
               irbvqgcmotzkhuxasdlj

               abn
               abn

               fwuvdbejcmxp
               pfejuvcmbxwd
               uvpwfbjcxedm
               cjvbexdmupwf
               vbumdfwjpcex

               khe
               hd
               dh

               wqksen
               nksqe
               xqsenk
               sqnkex

               qlusg
               sug
               usdg
               gus
               gus

               jdkbrvsagex
               ekvrdbgas
               kgvrbsdae
               dkbrasgve

               xabhuokifm
               ubmkhfaxio
               bmxufoakhi
               afomihukxb

               elpdrckvwjifyausq
               skapiruqvcbyjnzoge

               wdcxljfpsevakhgm
               lvxpahdkwsmecgj
               mswkvpljadexchg
               xpgajdskvwlehmc

               uvnfxd
               ukypde
               hudp
               uwdbh

               di
               id
               di
               di
               di

               vegjlhn
               uikdompq

               diaq
               iqa
               qia
               iqa
               qavi

               hjnedvzbrypcwt
               byncjwzhvmrdxte
               egpnzyxjdvbwctrh
               atwrobznehdvcyj

               uy
               wdu
               lipqvsu
               agpjebnu
               kmrxtfoczhu

               rcdupkmhivbfz
               dbuhrfpmkicavz
               dzcigyhvpbfumqk

               gvknrjuzah
               darevkqfbushz
               vhzwlkjpuari
               hvrizalykctu

               msqgzoy
               qmgiz

               qenaurhfb
               nqruafhbe
               ubhfrnqwaze
               eqranfhbu

               reknf
               nr

               m
               m
               m
               m
               m

               qdezurshbioc
               bdhrocqzusi
               hsizcqdobru
               hocsruziqdb
               chrbiqusdoz

               gdeikqytfabw
               qrkhapcfl

               zfqpubodgxvime
               gjeitykxzplbvohqard

               vz
               q
               q

               gdpyqiv
               xmhvtdoaywz
               ufneysbjlvkc

               tihbra
               no
               qmwo
               o
               m

               g
               om
               wpbdvku
               or

               k
               tk
               uk

               htf
               kcluo
               ohlscmjk
               gyrvazeiqdw

               xc
               gcx
               xc

               kfuenwlpmqaxr
               qukzifgdbnorva
               qutcshwknrmaf
               lprqafxkun
               uanfqrkm

               krwhnfvcgyt
               dmjqxliv
               lzvbdspxe
               vlmuaz

               x
               x
               x

               xhlgfrmncpadtovuisbj
               liaqdnuxmjofbs
               xejflmsnkbudayoiz

               njvuoamkpsirxg
               gkvmxrqoiauj
               vjucgoihdkmaxr
               exgizudkrmjaovl

               ikp
               yv
               ikz

               bwgsoup
               ugpwsbo
               wsjnpuogb

               lotn
               ltkon
               aoltwxbined
               tnokycl
               lnto

               m
               k
               k

               ecldgqtxpk
               qcmpxlhkagetd
               loxrdknsepvgt
               gixpfzjlkted

               hwp
               wh
               hw
               whm

               yknocjtxubvdfhwz
               ursndjpxzo

               scejb
               jbecl
               cejb
               jcbe
               jbxvec

               ifdc
               fiudsgjv
               fumqth
               pfi
               rwkfoylzaenb

               znubcxrwh
               ubvcrzqnwx

               uxym
               mx
               mxn

               beumoprjvkt
               uvrbfmepokj
               mjkvpouebr
               bmrvkjuope

               utgaxysljbvfm
               wpsdfavxogmyju
               rgemjxycksfvi

               mzeurqxtaoghdbc
               xuebcdrothzqmga
               adxtrmbczgqeohu

               nhuwbty
               tbuhniwy
               yhtbwnu
               tuwbyhn

               psfgnrqozcty
               wjvueck
               ijdexbclhm

               yxdwj
               wxd
               dxw

               sexcrtpdvfquikblhjaym
               chtlvbsyerxqupdfmjk
               xlyedbvjpcqhrmutksf

               nvuozspkxqrly
               uydmx

               kwyuicbzgnt
               tnyugbicwkz
               nubswzicgtyk
               yzwknutbgci
               zktngiucywb

               rakgqzus
               sqpg

               mlzrs
               hlpyi

               r
               r
               r

               uwckapi
               kgaipwcu
               wcuaipk
               wapicuk

               ybfnkgludqivhaorsz
               wblqaofsxkvhr
               rvlqakhosbwf
               lsrhaqofkbv

               ajqufyzreptihg
               csdmvxuknlobr

               bmn
               bcm
               bnm
               bym
               tbm

               cphtjyqwxfisagmln
               qhjlzycpsxigotwnfam
               wiyxfsthnljqpmgac
               mpfncbgshwyjlaxqidt

               optxzqvgmlacwireyjhkfb
               xkibgaquwejmdszhytnvrp

               jufbthmwr
               mrjbtuwfh
               wmfjutbhr
               bxrftjhwum
               jbuhwtfrm

               tzh
               thz

               f
               f
               f
               f
               f

               bqkn
               nqbk
               qknb
               bnkq
               knbq

               ydwexhmqru
               hdgmjatxqeovuwc

               abtg
               oabytg
               xgtbjh
               gvtabn

               cg
               cg

               yashgqblr
               shqlraygb

               bgqo
               ihn

               ukda
               dak
               mkdjczgta
               akdl
               dalk

               a
               a
               a

               e
               b
               e

               kqbai
               bapko
               abkiq
               kba
               bak

               sj
               a

               jh
               jdh
               fahj
               hj

               v
               v
               h
               s
               dr

               xhwj
               xhjm
               whjx

               wgh
               vymgwjoehna
               hwcg

               ompt
               luzvjx

               nfkrushty
               htrcskufyn
               hkrunysft

               eovbfkcaxdhzijwn
               mxwkdjbzrvhcnoefai
               xdbcofenviwzjapkh

               nvyatuqdw
               wdnvyauqt
               dvqatunwy
               twyavuqdn
               nducyvwtqa

               aijqfus
               qasuij
               uqsjia
               rjuasqi
               iesuajq

               zjkvduxstlrwqhbn
               hubvfndlowtzxk
               nbtuzkdcwavlxph
               hmnwuktxbdszvjl

               fgezk
               jndgyplmur
               akxzg

               xmbdlfr
               rlwftemjuzxd

               gpyldcbuom
               giqfrhbmo
               szxewnkjvat

               tuqomcgajf
               fqjaomgtuc
               cjqafgmoutl
               umatgofjqc

               lsrfvjaw
               wslvaj
               slajvw
               javlews

               vuqeolsca
               ihvqrul
               kbodztqlvu
               uvfpnwqjmy

               pytwl
               pwlty
               leptwy
               aypwlt
               yowxhtpgl

               bwcaoluzmh
               gamhuwczsi
               ulmoahzcw
               mdhrcvyukewpza
               wozuamqxch

               f
               f
               f
               f
               z

               h
               dh
               hj
               ljh

               tviblf
               wrdsaqvky
               umgexnohczj

               zjy
               j
               ksjow
               jhgxz
               jzx

               ct
               c
               cht
               c
               icov

               vsd
               wxvsdb
               vdsz
               ksvqmcd
               svidb

               xqzaucwk
               uadzwkqhcx

               ielspbgca
               gtislbezcap
               ebsgkaupic
               ezgabscpi
               pagibesc

               crjaozusnw
               vaxqblkz
               fmepdtg

               kylpaeoqgtbxvfmjzn
               oeplfxmgzjqybnkavt
               epgatylkvmozqnjfbx
               kqybplxjazgftmeonv
               jbzyvnqxkegopalmft

               jxvqf
               mfvo

               f
               f
               m
               f

               txazokpwm
               axoczpg
               adoxzp

               vytdpsizuq
               tiquvwszdpjy
               xyictdvlkqpgfsuz

               fqabeoinxkv
               udhkpbcmejy

               fvktomgcdbpjxawl
               dpsgbxmcvwkolafj
               bevkwdgjacflpmx

               xonyjrlzfmg
               gjlyfnorxz
               noxljrfygz
               grnlofjzxy
               zlxjoynrfg

               gwkahb
               qhkyw
               gwbhk
               hkcjpwls
               azkbwqh

               vpfdmnzj
               ugcqlatijedmpv

               mcnzq
               onm

               hnbjvmkgod
               jdngkhomvb
               dnbvogjmhk
               ojkgvhdnmb

               betpuzcnmrihwkdg
               hwrgduqcznbmxtpoelsfa
               gzdcwejumbvphnrt

               vapidj
               ujspa
               epxlmkf
               tgurp

               umlvkjpwyi
               dnwfipmv
               rivbemxwph

               lwvfbq
               wlbf
               alswbuf
               fwblv
               lwqfb

               jredugbaknc
               fndcxsqure
               cqrudyszenv
               fuylsvmneidrc

               klxpvdicbe
               rghplixcedkbv

               o
               zo
               oujs
               o

               lezgicaxjpbfrkvwushdtnqmo
               cizbdnotawjmxlvushkrgqpef

               lwqsberxcmhuvtjy
               wzmhxbyjoqlsvuecra
               lmurdwxicpgfqyhbejvs
               xhmbjvnutcsiewrqylk

               zpbynqdhlcio
               dbyhqcozpiln
               bnipcozqdyhl
               yondcqlzbhpi
               cyqdhbpoilgnz

               poygaer
               by
               xilybj

               ozqnwilxmtvsghdpabkfrj
               tohlwrznjimgkdqbpxfvsa
               qanigmplokbrvstxzfwhdj
               jxizrtakgopnqshdlmfwvb

               gcq
               nfrl

               mrsyplb
               nlb
               kcloasx
               leyuxp
               dtzvfjgiqlh

               rxlm
               xirs
               fxrasi
               iwxr
               grbqeox

               pe
               p
               p
               p
               p

               cjx
               tplnqfx

               cfe
               ecf
               nefc
               sefc

               lnt
               lnzx
               iltan
               mljcy

               rtsnluhmkbvjwqifgoceaz
               kfmcbsanwhivruztqjgole
               mkznvcrhsbtjaquloweifg
               ncbeltkasfzjrwuhqiogmv
               rgvasjifoctmnwkbeqhluz

               lxtiuyhcqrm
               mtlcrh
               mtrxbhflic
               mhtpecgvrl

               srcfjawukbzinqmxdhy
               fhixzjrkamwnscpuqgydo

               owjnbisvyl
               bpisjn
               tisjnb

               wnzixhqscam
               naqxzmivwchs
               qzxnascwmih
               xqnsahwzicm
               sqczmxnahiw

               dwtjvfkncqxuh
               dhgqtnkpuvjcwfx
               dlkyqchfwexnvutj

               ew
               wue

               pujbdat
               radse
               dwsea

               ean
               n
               n
               n
               n

               rzmwqiytucvpdnsfbgelh
               ozgwnxmauybredhsjqvp
               rxudgmvykhpeqbzswn

               josbygp
               vopsj
               adeczmjw

               fxodtyrkvmbg
               pgwkovxhtyufbdm
               fbxocpkligytdm
               znxaemofjgqdksyt

               ijxdhryqml
               rsjkvmyflz
               jlmrxyw

               sawmtrejogfxdnhkzi
               jodmbtzucfwyrpqivg

               apjgcrlztebs
               rotipxflzgcskjabe
               bcltgzprjsae
               vzreltacsjbpg

               o
               o
               xo
               zgoe
               lo

               koy
               poyk

               vagrbwxqfjlodi
               ibdrvaxgfojq
               qaxfgvodijbr

               ficdmvaluyrpxnqg
               ufgzriqpcwmdlya
               akiqyhgorpsetfudjlbc

               chsknb
               hbszn
               bzchnsx
               nvsbh
               dmysbnh

               gdpuyxihomjscwrq
               fnjsrcwyqmiloupdhx
               hfqrjxcyisupwlodm

               qiymdjhkzf
               dhjkqfmziy
               iqzmydkhfj
               kmvizhqdyfj
               bkzhfiyjmdq

               t
               tz
               at
               t

               avrslnxdkitbycg
               nbty
               pbomtynjwu
               fqybnht
               othfnbey

               xtrunekjicsm
               bqofpzaw
               vahlbywg

               iwdh
               hwd
               gmnyjskwd

               ikmlazfnbdorsjqeypuvthcwgx
               hgjtxplaebnmqzyufcvokiswdr
               wnckhtdbyufloiqepmjxgsvazr
               epfzmkcvtbxhulgsiqyndrawjo
               vyjortmhpxndlaeiqugwszfcbk

               yotxgwldvajb
               opbhatxwylvjg
               vjlxbrtkawg
               bolxvwgtja

               gcwhiafqpe
               heqwcapgif

               v
               v
               v
               v

               quljvbrwcankdz
               ulczjenwbqdva

               iuxpgankys
               aqnyupki
               pjvikyxaun
               opilkmnuzya
               paukiynj

               xghwsyorbezifcjdn
               aiycwghplobmzd
               icydztbguohqw
               oiydgwhzbcvm

               os
               fbxuzm
               dy

               rjpyidwgfvqleb
               eylqriwpbgf
               piarwefgylbq
               gfaebpyqilwr

               pjvmiedqkbowl
               pqimweboljvdk
               kpjemqdbwiovl
               lvmjeopbqwdik
               kmpqvjilweobd

               spzf
               fsvpa
               qspof
               sfp
               spf

               gey
               lhnmaeygb
               gey
               eyg

               mlnpetjzfcwuhsg
               miwfcjtlhpegnusz
               hncpztmsfwgluej
               mtjuspgcvfwelhzn
               jphsncfwzulgmte

               xo
               ox

               lmcrnftgyehbiauopxvq
               qbglamtefucxihroynvp
               taemubichnpfgovlqryx
               arfgqvnetlmicbuhoxyp
               ergfpvomtxnbchlaquiy

               dpvjzhctgoarwxslq
               thzvryowlpngksaxcqd

               jgxqdkvcfb
               xvtkfdcaqbg
               abqfvgwdxkc
               skpvqdbnfgxc

               xkcogdlq
               ogclkx
               xlkuoagvfbe
               gwxmlkod

               ilkrwvsm

               dlzhejcxgaounswfbrpyqm
               juhszbwcqnmfareo

               okjwxhu
               dnt
               pxzgny
               cbs

               widp
               piwd
               wpid
               pdiw

               pblk
               awkpi
               pkxr
               kpfz

               ap
               p
               pbyn

               fbzsyicupka
               zecusykamifqbpt
               icpauyfksbz

               seumyc
               c
               c
               ulacyj
               gpixcobt

               xoe
               r
               rw
               imx
               vgca

               uagdrmf
               qdrymuaxfg
               fmruazdg

               adp
               ap
               pxa
               pa
               sagp

               wtifbkzvuhnomscrxq
               nvcqhximsubtrfokwz
               bqznfxwohmkvutirsc
               ntusvqiwhzcoxfrbkm

               cpbly
               clpbye
               ycblp

               wmaxezdjgrocuksbp
               cuxkdjoea
               efxuaockjd
               kceoxldauj

               yfndzthcqvgp
               anphtqvcfz

               byecawnxd
               ecyndxawb

               z
               z
               z
               vz

               meypsculfjd
               cepvdinrls

               hqiu
               guis

               rxvj
               xvr
               xilvr
               ryjxv
               yrvx

               co
               oc
               co
               co
               oc

               gyjtrueqosz
               achxyfbvqkopetj

               zkrvufeglcywqtx
               hsekycwptiogul
               eyhljkcgwtpuo
               jgncytkblpweou

               nxhayv
               npqfohbrl
               kegchuidstwnm
               nzhlj
               """

    let day7 = """
               dark orange bags contain 3 dark chartreuse bags.
               striped fuchsia bags contain 5 striped lavender bags.
               dull gray bags contain 4 muted cyan bags, 3 light maroon bags.
               dull chartreuse bags contain 3 light tan bags, 3 dotted bronze bags, 4 dark crimson bags, 4 dull gold bags.
               shiny teal bags contain 3 muted maroon bags, 1 bright salmon bag, 2 dark chartreuse bags.
               dull crimson bags contain 1 clear cyan bag, 1 dark chartreuse bag, 1 drab gold bag, 1 dim black bag.
               plaid silver bags contain 2 muted bronze bags.
               mirrored lime bags contain 5 pale brown bags, 4 dark white bags, 1 wavy yellow bag.
               dark olive bags contain 5 light lavender bags, 5 vibrant tomato bags, 2 light purple bags.
               wavy fuchsia bags contain 3 striped gold bags, 4 vibrant brown bags, 3 pale blue bags, 2 shiny brown bags.
               mirrored tomato bags contain 3 light yellow bags, 4 dim indigo bags, 5 light beige bags, 3 posh indigo bags.
               striped red bags contain 2 muted crimson bags, 2 dim olive bags.
               dark crimson bags contain 1 striped chartreuse bag, 4 dark tan bags, 2 faded fuchsia bags, 5 mirrored black bags.
               mirrored green bags contain 3 mirrored violet bags, 2 faded beige bags.
               bright beige bags contain 4 faded magenta bags, 1 dotted purple bag, 2 mirrored cyan bags, 1 drab white bag.
               light orange bags contain 4 mirrored fuchsia bags, 5 clear maroon bags.
               faded magenta bags contain 3 drab beige bags.
               muted plum bags contain 5 faded turquoise bags, 2 pale silver bags, 4 dotted coral bags, 3 dim violet bags.
               wavy magenta bags contain 2 wavy brown bags, 5 clear turquoise bags, 3 plaid silver bags.
               bright white bags contain 1 plaid blue bag, 5 posh black bags, 1 shiny plum bag.
               mirrored maroon bags contain 4 drab gray bags, 1 muted fuchsia bag.
               posh lime bags contain 1 vibrant yellow bag.
               striped purple bags contain 3 light cyan bags, 4 mirrored gray bags.
               vibrant aqua bags contain 3 posh bronze bags.
               wavy maroon bags contain 3 posh fuchsia bags, 2 vibrant beige bags, 4 striped blue bags.
               plaid gold bags contain 5 dotted coral bags, 2 dim plum bags.
               dark beige bags contain 2 striped blue bags, 5 plaid lime bags.
               dim orange bags contain 2 faded salmon bags.
               dim olive bags contain 1 dim salmon bag.
               posh blue bags contain 5 muted chartreuse bags, 4 striped bronze bags, 1 wavy bronze bag.
               drab tan bags contain 2 faded beige bags, 1 dark tomato bag, 1 posh gold bag.
               wavy orange bags contain 4 dull aqua bags.
               bright chartreuse bags contain 1 clear gray bag, 1 clear magenta bag, 2 dark blue bags, 4 mirrored cyan bags.
               plaid orange bags contain 4 dotted aqua bags.
               dotted tomato bags contain 5 shiny white bags, 4 muted cyan bags, 5 wavy gray bags, 5 dull crimson bags.
               clear tomato bags contain 5 bright bronze bags, 5 posh blue bags.
               striped aqua bags contain 3 faded olive bags, 4 plaid maroon bags.
               dull indigo bags contain 1 light red bag, 4 pale indigo bags.
               pale plum bags contain 2 faded olive bags.
               bright aqua bags contain 5 drab fuchsia bags, 4 shiny orange bags, 1 dim lavender bag, 4 posh brown bags.
               mirrored salmon bags contain 3 clear cyan bags.
               wavy bronze bags contain 4 pale blue bags.
               mirrored gold bags contain 1 shiny turquoise bag, 4 clear magenta bags.
               faded maroon bags contain no other bags.
               striped olive bags contain 4 wavy tomato bags, 3 mirrored maroon bags.
               muted tan bags contain 5 dull fuchsia bags.
               pale turquoise bags contain 3 plaid chartreuse bags, 5 dim salmon bags, 3 faded maroon bags, 3 clear black bags.
               drab brown bags contain 3 shiny maroon bags, 3 plaid magenta bags.
               shiny salmon bags contain 2 light indigo bags.
               striped green bags contain 2 dotted gold bags, 4 plaid violet bags.
               dark cyan bags contain 5 posh beige bags, 2 posh turquoise bags, 4 clear brown bags.
               pale green bags contain 3 faded orange bags, 1 dotted purple bag, 5 vibrant silver bags, 3 posh purple bags.
               muted white bags contain 4 faded turquoise bags.
               dotted gray bags contain 1 dark coral bag, 3 light cyan bags, 4 pale white bags.
               pale fuchsia bags contain 4 shiny teal bags, 5 vibrant blue bags.
               wavy coral bags contain 3 muted aqua bags.
               vibrant turquoise bags contain 1 plaid red bag, 1 clear brown bag, 1 clear beige bag, 1 wavy brown bag.
               faded orange bags contain 4 bright coral bags, 1 mirrored cyan bag.
               dim tomato bags contain 2 wavy indigo bags, 3 dotted teal bags.
               wavy indigo bags contain 5 dotted yellow bags, 5 wavy aqua bags, 5 dotted lime bags, 4 clear brown bags.
               bright teal bags contain 4 muted magenta bags, 5 bright plum bags, 1 vibrant aqua bag.
               shiny coral bags contain 1 shiny black bag, 5 striped fuchsia bags, 4 shiny beige bags, 1 wavy bronze bag.
               dull beige bags contain 2 wavy cyan bags, 1 shiny lime bag, 3 dark purple bags.
               pale salmon bags contain 5 muted maroon bags, 3 striped bronze bags, 2 muted tan bags.
               light green bags contain 3 wavy tan bags, 5 muted purple bags, 3 drab violet bags, 4 posh maroon bags.
               dull red bags contain 2 drab yellow bags, 3 striped orange bags, 2 plaid teal bags.
               vibrant violet bags contain 2 clear plum bags, 1 dim tan bag, 5 wavy yellow bags.
               drab crimson bags contain 3 clear teal bags, 3 mirrored cyan bags.
               drab coral bags contain 4 posh aqua bags, 3 plaid salmon bags.
               vibrant cyan bags contain 4 drab chartreuse bags, 1 light yellow bag, 2 clear gold bags, 1 wavy olive bag.
               striped chartreuse bags contain 1 posh aqua bag, 5 posh salmon bags.
               pale yellow bags contain 3 vibrant brown bags, 3 faded maroon bags, 3 wavy bronze bags.
               mirrored red bags contain 1 plaid lavender bag, 5 clear green bags, 5 dark blue bags, 4 pale tan bags.
               dark yellow bags contain 3 mirrored aqua bags, 3 shiny plum bags, 1 mirrored silver bag, 1 faded tomato bag.
               plaid olive bags contain 3 mirrored red bags, 5 muted salmon bags, 3 bright bronze bags.
               vibrant olive bags contain 2 mirrored fuchsia bags.
               mirrored fuchsia bags contain 1 posh lime bag.
               mirrored tan bags contain 4 light teal bags, 4 dark bronze bags, 3 muted maroon bags.
               striped brown bags contain 5 posh lavender bags, 3 pale yellow bags, 1 light orange bag, 3 muted beige bags.
               clear yellow bags contain 3 dull black bags, 3 plaid violet bags, 5 wavy bronze bags.
               clear aqua bags contain 5 clear cyan bags, 2 pale crimson bags, 1 drab coral bag.
               dull cyan bags contain 5 dim tan bags, 1 striped black bag.
               muted turquoise bags contain 2 light olive bags, 5 light black bags.
               light fuchsia bags contain 1 drab coral bag, 4 muted plum bags, 4 dim lime bags.
               faded black bags contain 1 drab blue bag, 4 dark yellow bags.
               plaid green bags contain 3 dotted fuchsia bags, 4 light green bags, 1 dim lavender bag, 2 dotted black bags.
               dark tomato bags contain 5 plaid silver bags, 4 mirrored olive bags.
               shiny gray bags contain 2 posh brown bags, 1 posh cyan bag.
               muted orange bags contain 1 posh bronze bag, 2 bright blue bags.
               dotted green bags contain 4 pale gray bags, 4 wavy gray bags, 3 plaid gray bags.
               dotted salmon bags contain 1 pale violet bag, 1 bright bronze bag, 5 striped purple bags, 5 mirrored crimson bags.
               dim gold bags contain 1 light crimson bag, 4 dull crimson bags.
               clear bronze bags contain 2 striped maroon bags, 3 posh lavender bags.
               muted yellow bags contain 5 dull crimson bags, 2 clear lime bags.
               pale red bags contain 4 dim green bags.
               faded beige bags contain 2 light red bags, 2 wavy orange bags, 2 dim chartreuse bags, 2 dotted bronze bags.
               pale white bags contain 4 drab salmon bags, 4 clear silver bags, 1 muted cyan bag, 1 wavy plum bag.
               plaid coral bags contain 1 muted tan bag, 1 posh aqua bag, 3 plaid orange bags, 4 vibrant brown bags.
               light crimson bags contain 3 dotted coral bags, 4 clear beige bags, 4 shiny beige bags.
               dim beige bags contain 1 bright gray bag, 1 striped yellow bag.
               dull green bags contain 1 dim gold bag, 4 plaid lime bags.
               wavy black bags contain 2 faded teal bags, 5 dull lime bags, 4 dotted gold bags.
               mirrored teal bags contain 2 drab violet bags.
               mirrored violet bags contain 4 dotted crimson bags, 5 plaid beige bags.
               dim chartreuse bags contain 5 faded white bags, 2 posh chartreuse bags.
               dim bronze bags contain 4 wavy bronze bags, 4 clear maroon bags, 2 light gold bags.
               light silver bags contain 4 plaid coral bags, 4 muted chartreuse bags, 4 wavy white bags.
               faded tan bags contain 1 dark olive bag, 3 faded salmon bags, 2 dark gold bags.
               vibrant tan bags contain 3 light salmon bags, 2 shiny green bags, 5 pale white bags, 2 dark fuchsia bags.
               dim tan bags contain 1 mirrored magenta bag, 4 dull crimson bags, 5 faded lavender bags.
               shiny lime bags contain 5 dull yellow bags, 1 pale blue bag, 4 striped chartreuse bags, 3 drab magenta bags.
               dark red bags contain 3 drab yellow bags.
               pale lavender bags contain 1 posh cyan bag, 2 dim salmon bags, 4 bright lavender bags, 3 shiny lime bags.
               dim brown bags contain 3 dull white bags, 4 dim salmon bags, 1 plaid coral bag.
               clear blue bags contain 4 wavy turquoise bags, 3 mirrored fuchsia bags.
               dotted beige bags contain 1 pale indigo bag, 2 vibrant coral bags.
               dim crimson bags contain 1 light gold bag, 1 drab plum bag, 5 drab turquoise bags.
               clear coral bags contain 3 dull yellow bags, 4 mirrored turquoise bags, 3 dotted salmon bags, 3 faded lavender bags.
               mirrored purple bags contain 3 light cyan bags, 1 plaid salmon bag, 5 posh red bags.
               clear purple bags contain 2 plaid crimson bags.
               plaid beige bags contain 1 posh purple bag, 3 dark maroon bags, 1 clear cyan bag, 5 striped chartreuse bags.
               faded coral bags contain 3 pale silver bags.
               posh cyan bags contain 3 pale white bags, 2 posh tan bags, 2 bright silver bags.
               pale teal bags contain 4 shiny maroon bags, 1 clear tomato bag, 3 drab beige bags.
               posh turquoise bags contain 1 bright gray bag, 2 light crimson bags, 1 dotted aqua bag.
               striped gray bags contain 1 bright magenta bag, 2 striped coral bags, 1 bright orange bag, 5 bright lavender bags.
               vibrant fuchsia bags contain 2 dim black bags, 3 dark magenta bags, 3 dark violet bags.
               dotted turquoise bags contain 2 dull black bags.
               wavy gold bags contain 5 light purple bags, 1 wavy fuchsia bag.
               dotted coral bags contain no other bags.
               pale brown bags contain 3 mirrored blue bags, 2 drab coral bags.
               pale black bags contain 1 clear teal bag, 5 clear salmon bags.
               dull silver bags contain 1 plaid lime bag, 5 bright fuchsia bags, 4 pale silver bags.
               posh maroon bags contain 4 dotted orange bags, 1 mirrored blue bag.
               bright maroon bags contain 3 shiny tan bags, 3 striped purple bags, 5 posh blue bags, 2 dotted blue bags.
               striped crimson bags contain 1 clear cyan bag, 3 dark chartreuse bags, 3 plaid coral bags, 5 shiny plum bags.
               drab black bags contain 2 plaid fuchsia bags, 3 shiny cyan bags, 1 dotted coral bag, 3 bright fuchsia bags.
               mirrored yellow bags contain 3 dark indigo bags, 4 mirrored chartreuse bags, 4 pale purple bags.
               drab bronze bags contain 1 muted aqua bag.
               pale magenta bags contain 1 shiny red bag, 5 shiny beige bags, 3 dotted aqua bags.
               muted magenta bags contain 3 dotted purple bags, 4 dark bronze bags, 4 dim silver bags.
               bright olive bags contain 3 mirrored olive bags.
               pale lime bags contain 5 pale blue bags.
               dull turquoise bags contain 4 shiny red bags, 3 dotted coral bags, 2 dark maroon bags.
               shiny olive bags contain 2 posh beige bags, 1 posh aqua bag, 2 dark lavender bags, 2 pale yellow bags.
               dark bronze bags contain 5 faded turquoise bags, 2 striped turquoise bags, 3 mirrored gray bags, 1 dark cyan bag.
               clear turquoise bags contain 2 striped crimson bags, 3 dotted red bags, 5 striped yellow bags.
               dotted brown bags contain 3 bright gold bags, 4 posh lime bags.
               posh beige bags contain 3 drab beige bags, 2 dark chartreuse bags, 1 shiny plum bag, 5 dark maroon bags.
               dull blue bags contain 4 faded gray bags, 4 pale yellow bags, 3 dim salmon bags, 5 mirrored gray bags.
               muted brown bags contain 1 dull aqua bag.
               dull tan bags contain 3 shiny beige bags, 5 clear black bags, 5 clear cyan bags.
               shiny fuchsia bags contain 1 dark coral bag.
               plaid bronze bags contain 4 dim white bags, 2 posh plum bags.
               dull tomato bags contain 1 muted yellow bag, 4 dim indigo bags.
               shiny red bags contain 1 muted chartreuse bag, 1 light cyan bag, 5 bright blue bags, 3 vibrant maroon bags.
               faded fuchsia bags contain 4 dim gray bags, 1 drab gold bag.
               drab plum bags contain 1 plaid coral bag.
               drab salmon bags contain 1 dotted aqua bag, 1 striped purple bag, 4 posh blue bags.
               dim purple bags contain 5 dull violet bags.
               light red bags contain 2 plaid coral bags, 1 clear silver bag, 3 dull tan bags, 5 pale cyan bags.
               clear cyan bags contain 4 dotted coral bags.
               faded indigo bags contain 3 bright gray bags, 4 faded tomato bags, 1 drab coral bag, 1 dark brown bag.
               dotted magenta bags contain 3 muted yellow bags, 3 plaid salmon bags, 2 dark violet bags, 5 mirrored silver bags.
               bright tomato bags contain 3 clear cyan bags, 4 dotted aqua bags, 4 faded maroon bags.
               wavy olive bags contain 2 faded salmon bags, 4 posh silver bags, 2 drab white bags.
               striped turquoise bags contain 1 shiny plum bag.
               drab silver bags contain 5 pale white bags, 2 shiny white bags, 1 striped chartreuse bag, 5 dull turquoise bags.
               dim teal bags contain 1 plaid purple bag, 2 wavy lavender bags, 3 muted yellow bags.
               dull teal bags contain 3 dotted red bags.
               shiny silver bags contain 3 wavy yellow bags, 4 clear bronze bags.
               faded salmon bags contain 2 bright coral bags, 4 muted chartreuse bags.
               bright green bags contain 1 shiny crimson bag, 3 wavy tan bags.
               muted cyan bags contain 4 plaid red bags, 2 shiny teal bags.
               light salmon bags contain 3 muted turquoise bags, 5 posh orange bags, 1 dark lime bag, 5 pale orange bags.
               light gold bags contain 1 faded maroon bag, 2 dark white bags.
               faded gray bags contain 1 mirrored salmon bag, 2 posh magenta bags.
               mirrored magenta bags contain 5 pale blue bags.
               light gray bags contain 4 vibrant silver bags.
               posh indigo bags contain 2 dark plum bags, 1 dotted orange bag, 5 faded white bags.
               pale tan bags contain 5 wavy bronze bags, 1 muted indigo bag, 1 bright fuchsia bag, 2 light fuchsia bags.
               posh silver bags contain 2 faded plum bags, 5 striped lavender bags, 3 striped bronze bags.
               plaid black bags contain 3 bright crimson bags, 1 faded indigo bag.
               bright red bags contain 5 drab coral bags.
               wavy lavender bags contain 1 pale gold bag, 1 light tomato bag, 5 dull black bags.
               dark silver bags contain 1 dark white bag, 4 plaid magenta bags, 3 dull salmon bags.
               clear plum bags contain 3 faded maroon bags.
               vibrant silver bags contain 3 bright blue bags, 1 dark maroon bag, 5 light cyan bags, 3 dull crimson bags.
               light olive bags contain 4 light purple bags, 1 dark tomato bag, 4 drab chartreuse bags.
               mirrored olive bags contain 5 faded olive bags, 3 dull fuchsia bags, 3 plaid salmon bags, 3 light yellow bags.
               clear gold bags contain 1 drab teal bag.
               dark salmon bags contain 5 mirrored purple bags, 1 posh lavender bag, 5 light lavender bags, 1 muted white bag.
               posh aqua bags contain 5 faded maroon bags.
               plaid plum bags contain 2 dim gray bags, 3 dim tomato bags, 2 muted brown bags, 1 drab olive bag.
               muted red bags contain 3 dark black bags, 5 plaid fuchsia bags, 5 bright fuchsia bags, 5 wavy lavender bags.
               mirrored crimson bags contain 2 mirrored aqua bags.
               dotted black bags contain 1 drab coral bag.
               dark violet bags contain 2 posh chartreuse bags, 2 muted cyan bags, 2 striped bronze bags, 5 dim plum bags.
               plaid salmon bags contain 3 muted tan bags, 3 clear plum bags, 4 bright gold bags.
               mirrored chartreuse bags contain 1 dull tan bag, 2 posh plum bags.
               shiny orange bags contain 1 striped yellow bag, 3 dark chartreuse bags.
               shiny purple bags contain 1 mirrored beige bag.
               wavy blue bags contain 3 faded black bags, 2 striped turquoise bags, 4 muted yellow bags, 2 clear lime bags.
               striped indigo bags contain 1 posh silver bag, 3 plaid aqua bags, 5 plaid maroon bags.
               mirrored gray bags contain 3 bright blue bags.
               muted tomato bags contain 1 dotted tomato bag.
               wavy tan bags contain 2 faded salmon bags, 2 dark brown bags, 3 wavy violet bags, 1 vibrant coral bag.
               striped cyan bags contain 2 dotted tomato bags, 1 mirrored tomato bag, 1 wavy plum bag, 2 clear olive bags.
               faded chartreuse bags contain 2 light blue bags, 5 bright bronze bags, 5 muted silver bags.
               drab maroon bags contain 1 clear olive bag, 3 mirrored cyan bags.
               posh yellow bags contain 2 shiny lavender bags, 4 bright tomato bags, 3 dim tan bags, 2 dotted silver bags.
               muted gray bags contain 5 striped lavender bags, 3 shiny red bags, 3 dark chartreuse bags, 3 faded olive bags.
               striped violet bags contain 4 striped white bags.
               bright blue bags contain 5 plaid orange bags, 4 dark chartreuse bags, 2 dotted coral bags, 1 wavy teal bag.
               dull magenta bags contain 4 bright tomato bags, 5 plaid aqua bags.
               muted black bags contain 5 vibrant blue bags.
               mirrored coral bags contain 2 shiny coral bags, 4 light tan bags.
               mirrored plum bags contain 1 posh bronze bag, 2 dotted olive bags, 5 drab bronze bags, 2 striped tomato bags.
               dull olive bags contain 1 posh beige bag.
               clear olive bags contain 4 shiny olive bags, 5 muted tan bags.
               light magenta bags contain 3 dark white bags.
               dotted lime bags contain 4 vibrant brown bags, 1 light yellow bag, 5 dim violet bags, 2 dim olive bags.
               light bronze bags contain 1 shiny olive bag, 1 drab silver bag, 3 vibrant silver bags, 1 muted tan bag.
               clear violet bags contain 4 wavy lavender bags.
               dull purple bags contain 1 bright purple bag, 2 shiny lime bags, 2 drab salmon bags, 3 dull aqua bags.
               light brown bags contain 4 shiny lime bags, 3 wavy salmon bags.
               posh green bags contain 4 drab green bags.
               striped salmon bags contain 2 pale brown bags.
               dotted maroon bags contain 4 pale bronze bags, 3 mirrored silver bags, 3 muted purple bags, 5 dull lime bags.
               mirrored beige bags contain 3 clear tan bags, 4 light beige bags.
               bright gold bags contain 1 light cyan bag, 1 dotted coral bag.
               drab gray bags contain 4 posh lime bags.
               clear brown bags contain 4 muted gray bags, 5 shiny gold bags.
               dotted plum bags contain 2 drab maroon bags, 3 dotted olive bags, 3 plaid maroon bags, 5 striped magenta bags.
               dim magenta bags contain 3 bright crimson bags, 3 dark aqua bags.
               faded crimson bags contain 5 dull brown bags, 4 dark violet bags, 3 striped gray bags.
               pale purple bags contain 1 light black bag, 3 dark salmon bags, 4 drab blue bags, 1 posh indigo bag.
               drab aqua bags contain 3 pale tomato bags, 4 drab gray bags, 2 wavy yellow bags.
               plaid fuchsia bags contain 5 faded indigo bags, 3 clear plum bags, 2 shiny tan bags.
               posh salmon bags contain 1 mirrored gray bag, 3 vibrant maroon bags, 1 dotted coral bag, 3 clear maroon bags.
               faded teal bags contain 3 bright indigo bags, 5 striped red bags, 3 dark turquoise bags, 5 dark tan bags.
               shiny cyan bags contain 3 bright gray bags, 3 posh beige bags, 2 dark blue bags.
               dim aqua bags contain 3 muted magenta bags.
               dim coral bags contain 1 pale cyan bag, 4 wavy green bags, 2 posh salmon bags.
               drab blue bags contain 1 dotted crimson bag, 1 posh silver bag.
               bright silver bags contain 1 shiny red bag, 2 bright bronze bags, 1 wavy white bag.
               pale cyan bags contain 3 clear black bags.
               dull white bags contain 2 dark white bags.
               wavy plum bags contain 5 bright purple bags.
               striped yellow bags contain 3 muted gray bags, 3 posh red bags, 4 faded olive bags.
               dim fuchsia bags contain 5 dim lime bags, 3 dull olive bags.
               dotted olive bags contain 5 muted cyan bags, 4 vibrant violet bags.
               dim white bags contain 2 light tomato bags.
               mirrored indigo bags contain 4 dim tan bags, 4 dim tomato bags, 2 shiny cyan bags, 2 shiny tomato bags.
               dotted teal bags contain 5 posh white bags, 5 muted bronze bags, 3 pale cyan bags.
               striped gold bags contain 4 dark coral bags, 4 striped aqua bags, 1 bright plum bag.
               dull black bags contain 1 dull aqua bag, 4 wavy tan bags, 1 dotted red bag, 5 mirrored aqua bags.
               dim maroon bags contain 3 plaid gold bags, 4 shiny beige bags, 5 dull yellow bags, 2 dark white bags.
               vibrant yellow bags contain 4 plaid coral bags, 5 muted silver bags, 3 posh red bags.
               pale indigo bags contain 1 shiny blue bag, 2 muted aqua bags, 1 drab beige bag, 2 muted maroon bags.
               dull yellow bags contain 4 posh aqua bags, 2 shiny red bags, 1 shiny coral bag, 3 pale magenta bags.
               plaid tan bags contain 4 faded plum bags, 2 plaid aqua bags.
               clear crimson bags contain 4 light cyan bags, 5 faded purple bags.
               pale maroon bags contain 5 plaid orange bags.
               light purple bags contain 2 faded cyan bags, 5 shiny red bags.
               pale crimson bags contain 4 dark chartreuse bags, 1 mirrored gray bag, 3 dim salmon bags, 2 mirrored purple bags.
               mirrored cyan bags contain 1 drab salmon bag, 4 mirrored magenta bags, 2 mirrored lime bags.
               shiny bronze bags contain 3 muted yellow bags.
               faded purple bags contain 5 drab black bags.
               dotted red bags contain 3 light gold bags, 4 light yellow bags, 3 shiny coral bags.
               plaid aqua bags contain 5 plaid orange bags, 1 dotted coral bag, 5 light cyan bags, 5 clear cyan bags.
               shiny tomato bags contain 2 dark tomato bags, 1 dull olive bag, 5 striped tomato bags, 5 muted gold bags.
               light turquoise bags contain 1 dull tan bag.
               vibrant blue bags contain 1 clear bronze bag, 4 posh purple bags.
               pale violet bags contain 4 dotted red bags, 3 clear beige bags.
               dotted orange bags contain 3 bright crimson bags, 2 wavy aqua bags.
               vibrant plum bags contain 3 mirrored beige bags, 3 mirrored salmon bags.
               wavy cyan bags contain 3 plaid magenta bags, 2 light gold bags.
               dark lavender bags contain 3 posh chartreuse bags, 3 dotted red bags, 3 bright fuchsia bags.
               bright lime bags contain 3 muted aqua bags, 1 plaid salmon bag, 2 mirrored purple bags, 3 pale silver bags.
               pale chartreuse bags contain 1 dotted white bag, 3 clear purple bags.
               striped silver bags contain 2 faded maroon bags, 2 mirrored gray bags, 1 muted chartreuse bag.
               vibrant bronze bags contain 2 striped crimson bags, 4 mirrored white bags, 4 plaid gray bags.
               wavy tomato bags contain 4 clear lime bags, 3 posh indigo bags, 1 vibrant brown bag, 4 dotted chartreuse bags.
               striped tan bags contain 4 dark black bags, 5 plaid yellow bags.
               bright bronze bags contain 1 clear lime bag.
               dotted gold bags contain 4 muted green bags.
               dotted indigo bags contain 5 mirrored olive bags, 5 posh violet bags.
               vibrant purple bags contain 4 posh aqua bags, 3 mirrored magenta bags, 2 wavy yellow bags, 1 dotted teal bag.
               wavy purple bags contain 5 light red bags, 4 faded white bags.
               faded violet bags contain 4 wavy silver bags, 5 faded orange bags.
               clear red bags contain 4 posh olive bags, 5 shiny cyan bags.
               bright tan bags contain 3 mirrored chartreuse bags.
               muted bronze bags contain 2 dark chartreuse bags, 5 dotted aqua bags.
               wavy chartreuse bags contain 3 mirrored turquoise bags, 3 drab black bags, 3 wavy salmon bags.
               light cyan bags contain no other bags.
               muted indigo bags contain 2 plaid orange bags, 3 dim olive bags, 4 dim lime bags.
               vibrant brown bags contain 3 dull white bags.
               plaid magenta bags contain 4 dark white bags, 1 wavy gray bag, 3 pale blue bags, 1 faded lavender bag.
               dim blue bags contain 1 bright red bag, 2 clear plum bags, 3 pale blue bags.
               pale tomato bags contain 5 striped orange bags, 2 dark crimson bags, 2 mirrored silver bags.
               pale orange bags contain 4 bright coral bags, 3 dark violet bags.
               plaid tomato bags contain 3 bright lime bags.
               bright coral bags contain 3 light cyan bags.
               plaid indigo bags contain 5 posh brown bags, 3 striped fuchsia bags.
               drab white bags contain 1 mirrored purple bag, 2 light tomato bags.
               drab indigo bags contain 2 clear lime bags, 2 vibrant white bags, 4 clear gold bags.
               dim silver bags contain 1 mirrored blue bag, 2 pale tomato bags, 2 dark tan bags, 4 dotted indigo bags.
               vibrant indigo bags contain 5 pale white bags, 3 posh fuchsia bags, 4 drab lavender bags, 3 striped red bags.
               faded aqua bags contain 4 pale tan bags, 2 shiny indigo bags, 1 plaid magenta bag, 5 plaid orange bags.
               wavy green bags contain 5 dim brown bags, 1 dark turquoise bag.
               mirrored white bags contain 3 vibrant violet bags, 4 wavy yellow bags.
               drab orange bags contain 5 dark maroon bags, 1 bright cyan bag, 2 shiny salmon bags.
               shiny green bags contain 2 dim olive bags, 5 light brown bags, 2 dotted violet bags.
               drab lime bags contain 5 light tan bags, 1 clear black bag, 5 plaid aqua bags, 2 wavy teal bags.
               faded plum bags contain 4 bright tomato bags, 3 dark maroon bags, 1 dotted coral bag.
               clear white bags contain 5 mirrored purple bags.
               shiny violet bags contain 3 striped green bags, 5 vibrant blue bags, 3 vibrant lime bags, 5 clear green bags.
               dotted cyan bags contain 5 wavy tan bags, 4 shiny coral bags.
               striped lavender bags contain 5 dotted chartreuse bags, 1 plaid aqua bag, 2 dotted coral bags, 1 dark maroon bag.
               pale silver bags contain 3 dull fuchsia bags, 2 plaid orange bags, 1 wavy bronze bag, 5 shiny black bags.
               clear beige bags contain 3 striped chartreuse bags, 3 dotted red bags.
               dim plum bags contain 1 bright purple bag, 2 posh red bags.
               bright crimson bags contain 5 vibrant maroon bags, 5 bright purple bags, 3 clear cyan bags.
               pale coral bags contain 3 mirrored silver bags.
               bright violet bags contain 4 light brown bags, 5 vibrant cyan bags, 3 wavy beige bags, 1 dim violet bag.
               dark maroon bags contain no other bags.
               shiny blue bags contain 3 dark white bags.
               vibrant salmon bags contain 4 clear red bags, 1 dark aqua bag, 5 vibrant purple bags.
               muted gold bags contain 3 light turquoise bags, 2 faded cyan bags, 4 clear cyan bags, 1 wavy plum bag.
               shiny lavender bags contain 1 dim salmon bag.
               dull aqua bags contain 3 drab blue bags, 2 mirrored gray bags.
               clear teal bags contain 2 faded cyan bags, 1 dotted beige bag.
               clear maroon bags contain 4 wavy teal bags.
               wavy crimson bags contain 5 vibrant brown bags.
               light chartreuse bags contain 2 clear plum bags, 3 dull orange bags, 3 plaid fuchsia bags, 1 light tomato bag.
               shiny white bags contain 5 plaid lavender bags, 3 bright indigo bags, 2 posh violet bags, 4 dull crimson bags.
               faded bronze bags contain 4 light turquoise bags.
               vibrant chartreuse bags contain 1 clear black bag.
               dull maroon bags contain 1 shiny orange bag.
               shiny black bags contain no other bags.
               shiny magenta bags contain 1 shiny teal bag, 3 faded gray bags, 4 shiny white bags.
               posh orange bags contain 4 plaid gold bags.
               light aqua bags contain 2 plaid violet bags, 5 dim tan bags.
               faded lavender bags contain 2 plaid salmon bags.
               dotted tan bags contain 4 wavy green bags, 5 bright gray bags.
               posh teal bags contain 1 muted white bag, 3 plaid beige bags, 2 plaid magenta bags, 2 light tomato bags.
               drab chartreuse bags contain 5 posh purple bags, 1 light tomato bag.
               mirrored lavender bags contain 4 striped salmon bags, 3 striped lavender bags, 5 dull indigo bags, 5 shiny fuchsia bags.
               plaid violet bags contain 2 dotted chartreuse bags, 4 muted white bags, 4 dark tan bags, 2 dark brown bags.
               dotted crimson bags contain 4 mirrored magenta bags, 2 wavy white bags, 1 wavy teal bag.
               clear lavender bags contain 4 striped tomato bags, 1 light maroon bag, 3 light bronze bags, 4 striped coral bags.
               vibrant gray bags contain 1 dark tan bag, 1 posh chartreuse bag.
               wavy violet bags contain 1 clear black bag, 5 shiny plum bags, 1 shiny black bag, 1 faded lavender bag.
               faded red bags contain 4 drab coral bags, 1 clear aqua bag.
               clear black bags contain 3 bright blue bags, 2 striped silver bags, 1 wavy teal bag, 2 light yellow bags.
               dim gray bags contain 4 faded turquoise bags, 4 striped bronze bags, 4 drab gold bags.
               faded blue bags contain 4 bright orange bags, 4 dotted aqua bags, 1 muted plum bag.
               dotted violet bags contain 3 light white bags.
               mirrored bronze bags contain 2 shiny lime bags, 1 mirrored chartreuse bag, 5 dim gold bags, 5 dim aqua bags.
               faded turquoise bags contain 1 dark white bag, 4 muted chartreuse bags, 2 light cyan bags, 4 posh aqua bags.
               clear tan bags contain 4 vibrant aqua bags, 1 dull gold bag, 5 bright fuchsia bags.
               posh lavender bags contain 5 wavy plum bags, 2 striped bronze bags, 5 wavy white bags.
               vibrant crimson bags contain 1 vibrant silver bag, 3 dotted crimson bags.
               dark coral bags contain 3 plaid tan bags.
               plaid white bags contain 3 dim cyan bags, 4 drab lime bags.
               striped blue bags contain 5 striped lavender bags, 1 bright salmon bag.
               drab turquoise bags contain 4 striped lime bags.
               dim turquoise bags contain 1 bright gold bag.
               bright yellow bags contain 2 plaid black bags, 5 faded lime bags, 2 plaid coral bags, 2 posh crimson bags.
               pale gray bags contain 3 dark maroon bags, 2 dark yellow bags, 1 dim violet bag.
               wavy brown bags contain 2 shiny fuchsia bags, 1 muted bronze bag, 5 pale white bags, 4 wavy silver bags.
               posh tomato bags contain 1 shiny beige bag, 3 wavy maroon bags, 4 shiny plum bags.
               dull lime bags contain 4 vibrant maroon bags.
               dull salmon bags contain 5 dim brown bags, 1 mirrored white bag, 1 dotted gold bag, 1 vibrant gold bag.
               vibrant teal bags contain 1 pale brown bag, 3 shiny crimson bags, 2 striped tomato bags.
               shiny plum bags contain 4 dotted aqua bags.
               wavy white bags contain 1 bright crimson bag, 1 clear cyan bag, 4 dark white bags, 3 vibrant maroon bags.
               dim red bags contain 5 shiny lavender bags, 1 wavy yellow bag.
               clear salmon bags contain 5 dim indigo bags, 2 dark black bags.
               muted lime bags contain 2 shiny white bags.
               dim cyan bags contain 1 shiny blue bag, 5 light cyan bags, 1 bright tomato bag, 4 vibrant yellow bags.
               dark brown bags contain 3 posh aqua bags.
               faded white bags contain 1 mirrored purple bag.
               drab olive bags contain 4 dotted salmon bags.
               dull gold bags contain 3 wavy salmon bags, 3 dotted crimson bags, 4 drab violet bags.
               dotted fuchsia bags contain 5 pale gold bags, 4 faded olive bags, 5 posh black bags.
               clear green bags contain 3 faded tomato bags, 5 faded maroon bags, 4 dotted red bags, 2 bright crimson bags.
               muted maroon bags contain 5 dark white bags, 2 dotted chartreuse bags, 2 shiny black bags, 3 light gold bags.
               vibrant beige bags contain 5 light tan bags.
               dark indigo bags contain 2 faded fuchsia bags, 2 dotted beige bags, 1 mirrored green bag, 1 wavy yellow bag.
               shiny aqua bags contain 3 vibrant lavender bags, 5 posh bronze bags, 5 clear purple bags.
               plaid gray bags contain 3 dim brown bags, 4 dull aqua bags.
               plaid crimson bags contain 2 dark bronze bags, 3 dim beige bags, 5 drab salmon bags, 3 bright coral bags.
               posh fuchsia bags contain 5 muted yellow bags.
               vibrant magenta bags contain 1 dotted cyan bag, 1 striped green bag, 5 plaid gray bags, 3 pale olive bags.
               vibrant tomato bags contain 5 plaid beige bags, 5 clear silver bags, 1 light cyan bag, 4 posh silver bags.
               drab purple bags contain 5 wavy olive bags, 1 drab blue bag.
               dark purple bags contain 4 pale teal bags.
               mirrored orange bags contain 2 mirrored blue bags, 2 drab gold bags, 2 light blue bags, 2 dotted cyan bags.
               muted aqua bags contain 2 pale blue bags, 4 striped purple bags.
               wavy beige bags contain 1 dim aqua bag.
               muted fuchsia bags contain 3 clear chartreuse bags, 3 drab white bags, 4 plaid magenta bags.
               clear magenta bags contain 4 pale brown bags.
               posh bronze bags contain 5 mirrored magenta bags.
               dotted yellow bags contain 5 clear green bags, 3 muted aqua bags, 5 clear beige bags.
               wavy salmon bags contain 5 light crimson bags, 5 muted gray bags, 5 clear plum bags, 1 striped purple bag.
               dim violet bags contain 2 shiny blue bags, 4 dark brown bags.
               clear fuchsia bags contain 1 mirrored coral bag, 2 dim gray bags, 3 pale orange bags.
               dark green bags contain 3 clear bronze bags, 4 mirrored cyan bags, 3 dark brown bags, 5 dotted gray bags.
               muted purple bags contain 5 muted orange bags, 3 plaid aqua bags, 4 clear chartreuse bags, 4 vibrant indigo bags.
               pale blue bags contain no other bags.
               dull fuchsia bags contain 3 bright blue bags.
               light indigo bags contain 4 dull fuchsia bags, 1 striped silver bag, 5 wavy aqua bags.
               muted teal bags contain 3 vibrant black bags, 1 dark maroon bag, 5 dark white bags, 5 dark plum bags.
               mirrored brown bags contain 4 shiny lavender bags, 2 light lime bags.
               striped teal bags contain 1 striped lime bag.
               posh magenta bags contain 4 muted crimson bags, 5 shiny blue bags, 2 plaid orange bags.
               dark turquoise bags contain 1 bright tomato bag, 1 dim violet bag.
               muted olive bags contain 2 pale lavender bags, 5 plaid plum bags, 1 faded gold bag.
               plaid yellow bags contain 1 muted gold bag.
               light plum bags contain 2 dull aqua bags.
               shiny yellow bags contain 3 mirrored magenta bags, 1 dark violet bag.
               vibrant green bags contain 3 striped fuchsia bags, 1 dull gold bag, 5 muted lavender bags.
               wavy lime bags contain 5 wavy purple bags, 4 muted coral bags, 2 vibrant indigo bags.
               bright lavender bags contain 5 dotted lime bags.
               striped orange bags contain 1 wavy tan bag.
               dim indigo bags contain 3 striped tan bags, 5 dotted red bags.
               vibrant coral bags contain 4 drab bronze bags, 3 dark brown bags, 3 plaid orange bags, 4 pale crimson bags.
               dull plum bags contain 1 muted maroon bag.
               bright plum bags contain 5 dull tan bags, 4 mirrored blue bags, 3 dull fuchsia bags, 3 wavy violet bags.
               faded silver bags contain 4 wavy orange bags, 2 dim salmon bags.
               wavy silver bags contain 3 light red bags, 4 faded gray bags, 1 dim tan bag.
               drab teal bags contain 4 posh chartreuse bags, 1 posh salmon bag.
               light blue bags contain 2 bright lime bags.
               mirrored turquoise bags contain 1 drab lime bag, 5 mirrored gray bags.
               pale beige bags contain 5 bright tomato bags, 2 mirrored magenta bags, 2 faded gray bags, 1 shiny yellow bag.
               muted violet bags contain 3 muted indigo bags, 1 wavy aqua bag, 1 posh lime bag.
               dull violet bags contain 4 dark red bags.
               bright cyan bags contain 1 dull aqua bag.
               muted chartreuse bags contain no other bags.
               vibrant red bags contain 5 posh fuchsia bags, 5 shiny brown bags, 5 vibrant plum bags.
               posh gold bags contain 2 dull magenta bags, 4 posh plum bags, 1 muted violet bag.
               vibrant white bags contain 1 dull magenta bag, 2 dull crimson bags, 1 vibrant tomato bag.
               shiny beige bags contain 3 bright blue bags, 1 bright purple bag.
               light lime bags contain 1 shiny gold bag, 3 posh salmon bags.
               light maroon bags contain 1 dark maroon bag.
               dark magenta bags contain 2 dotted crimson bags, 2 dim lavender bags.
               shiny indigo bags contain 3 dim lavender bags.
               bright salmon bags contain 2 posh beige bags.
               posh red bags contain 2 muted chartreuse bags, 3 shiny plum bags, 5 mirrored gray bags, 2 bright tomato bags.
               striped plum bags contain 2 posh purple bags, 2 plaid purple bags, 1 posh bronze bag, 2 bright tomato bags.
               clear gray bags contain 3 dark violet bags, 1 bright silver bag, 4 striped chartreuse bags, 3 muted gray bags.
               posh gray bags contain 5 light maroon bags, 4 dull black bags.
               striped beige bags contain 2 dark yellow bags.
               muted blue bags contain 2 pale indigo bags, 5 bright gold bags.
               dim black bags contain 3 bright purple bags, 1 shiny black bag, 4 vibrant lime bags.
               dark blue bags contain 1 pale bronze bag, 5 posh turquoise bags.
               dark black bags contain 4 striped fuchsia bags.
               light teal bags contain 4 drab tomato bags, 5 bright lavender bags.
               light black bags contain 2 wavy olive bags, 4 wavy plum bags, 5 posh indigo bags.
               dull bronze bags contain 3 posh fuchsia bags, 2 plaid orange bags.
               plaid purple bags contain 2 light tomato bags, 1 drab bronze bag.
               striped black bags contain 4 clear silver bags.
               muted salmon bags contain 5 dim red bags, 1 mirrored tomato bag, 2 bright coral bags, 1 pale coral bag.
               faded yellow bags contain 5 pale orange bags, 4 dim maroon bags, 5 posh lavender bags.
               clear indigo bags contain 1 dim aqua bag.
               drab green bags contain 3 plaid black bags.
               striped tomato bags contain 1 dim orange bag, 5 light indigo bags, 3 pale bronze bags.
               posh black bags contain 1 mirrored magenta bag, 5 drab plum bags, 2 pale crimson bags.
               dull lavender bags contain 5 dull black bags, 4 dim black bags.
               light lavender bags contain 3 posh blue bags, 5 mirrored blue bags, 1 dotted yellow bag.
               dotted bronze bags contain 3 bright tomato bags, 4 bright purple bags, 1 dotted red bag.
               bright indigo bags contain 3 posh tan bags, 2 posh silver bags.
               mirrored black bags contain 5 shiny teal bags, 4 vibrant maroon bags.
               bright gray bags contain 3 posh chartreuse bags, 1 wavy bronze bag.
               bright magenta bags contain 2 shiny tan bags.
               shiny gold bags contain 2 pale blue bags, 1 clear black bag, 2 wavy teal bags, 3 dotted red bags.
               dark tan bags contain 1 shiny coral bag, 4 posh chartreuse bags, 3 dark chartreuse bags.
               dim lime bags contain 1 dull yellow bag, 1 dim gray bag.
               dotted white bags contain 2 vibrant coral bags, 1 striped red bag.
               faded cyan bags contain 1 pale silver bag.
               vibrant lime bags contain 5 bright tomato bags, 3 dull white bags, 3 plaid orange bags, 2 pale blue bags.
               pale aqua bags contain 1 dull red bag, 2 bright aqua bags, 1 light lime bag, 3 clear indigo bags.
               vibrant black bags contain 4 posh salmon bags, 2 shiny salmon bags, 2 mirrored crimson bags, 5 shiny orange bags.
               wavy red bags contain 3 shiny lavender bags, 4 dotted yellow bags.
               faded brown bags contain 5 shiny chartreuse bags.
               dark teal bags contain 4 dotted aqua bags, 2 posh lavender bags, 1 dull indigo bag, 5 posh lime bags.
               shiny tan bags contain 4 mirrored lime bags, 4 shiny bronze bags, 4 striped crimson bags.
               pale bronze bags contain 2 clear chartreuse bags, 1 plaid coral bag.
               light tan bags contain 1 dark coral bag, 3 posh chartreuse bags.
               drab beige bags contain 4 clear cyan bags, 4 dotted aqua bags.
               plaid blue bags contain 1 light cyan bag, 1 mirrored salmon bag.
               bright orange bags contain 3 muted cyan bags, 4 bright olive bags, 5 dark yellow bags, 2 wavy gray bags.
               dark plum bags contain 4 pale orange bags, 4 mirrored salmon bags.
               clear orange bags contain 5 dark teal bags, 1 muted crimson bag, 5 dotted tan bags.
               light white bags contain 2 dull black bags, 1 muted crimson bag, 5 pale plum bags.
               dark fuchsia bags contain 2 light yellow bags, 4 vibrant tomato bags.
               clear lime bags contain 4 pale silver bags, 2 plaid salmon bags.
               drab fuchsia bags contain 2 shiny coral bags, 3 drab white bags, 2 dull lime bags.
               drab tomato bags contain 3 striped aqua bags, 1 mirrored black bag.
               plaid turquoise bags contain 1 light purple bag, 3 mirrored black bags, 2 bright tan bags.
               plaid lime bags contain 1 dull tan bag, 2 muted silver bags.
               posh white bags contain 4 dotted red bags.
               drab magenta bags contain 1 posh aqua bag, 2 plaid salmon bags.
               bright black bags contain 2 posh white bags, 4 drab gray bags, 5 dotted indigo bags, 3 faded blue bags.
               shiny brown bags contain 1 vibrant violet bag, 4 vibrant lime bags.
               dim lavender bags contain 2 wavy green bags, 5 bright fuchsia bags, 5 clear lime bags.
               clear chartreuse bags contain 5 faded salmon bags, 3 drab bronze bags, 4 dull magenta bags.
               light violet bags contain 5 mirrored orange bags, 3 muted gray bags, 5 striped gray bags, 2 pale lavender bags.
               posh brown bags contain 3 light maroon bags, 1 muted lavender bag, 3 faded gray bags, 2 posh chartreuse bags.
               dim salmon bags contain 1 faded turquoise bag, 5 vibrant maroon bags, 3 drab cyan bags, 4 dim black bags.
               muted beige bags contain 2 vibrant white bags, 1 posh salmon bag.
               faded gold bags contain 1 drab brown bag, 1 light blue bag.
               light yellow bags contain 4 dark chartreuse bags, 2 dull fuchsia bags.
               wavy turquoise bags contain 3 posh brown bags, 2 dotted salmon bags.
               dark gold bags contain 4 muted maroon bags.
               vibrant orange bags contain 1 dull maroon bag, 3 light tan bags, 4 shiny maroon bags.
               plaid teal bags contain 5 faded maroon bags.
               plaid brown bags contain 4 clear tomato bags, 1 striped silver bag, 2 plaid coral bags, 5 dull blue bags.
               bright purple bags contain no other bags.
               drab red bags contain 1 striped white bag, 4 light red bags, 1 bright purple bag.
               striped coral bags contain 4 pale tan bags, 1 dim fuchsia bag, 1 dim white bag, 3 bright crimson bags.
               posh tan bags contain 4 striped fuchsia bags.
               drab cyan bags contain 4 shiny gold bags, 5 light cyan bags, 3 posh blue bags.
               dull brown bags contain 3 clear silver bags, 2 dotted crimson bags.
               drab violet bags contain 4 muted cyan bags, 4 clear maroon bags, 5 plaid beige bags, 3 dull aqua bags.
               bright turquoise bags contain 3 pale turquoise bags.
               posh crimson bags contain 3 muted tan bags, 4 vibrant gray bags, 3 mirrored aqua bags, 4 striped indigo bags.
               dotted aqua bags contain no other bags.
               bright brown bags contain 1 dark chartreuse bag.
               posh purple bags contain 5 clear maroon bags, 2 clear lime bags, 1 faded salmon bag.
               drab lavender bags contain 4 drab magenta bags.
               clear silver bags contain 2 dull white bags, 5 dotted aqua bags, 1 vibrant maroon bag.
               dotted silver bags contain 4 faded cyan bags, 4 plaid lavender bags, 4 drab magenta bags.
               vibrant lavender bags contain 4 posh aqua bags, 2 pale lime bags, 4 dotted purple bags.
               posh violet bags contain 4 dark chartreuse bags, 2 plaid tan bags, 2 bright gray bags, 4 faded salmon bags.
               shiny chartreuse bags contain 5 drab coral bags, 2 light yellow bags.
               plaid red bags contain 1 drab cyan bag, 5 pale brown bags, 4 dark brown bags.
               dotted lavender bags contain 1 bright fuchsia bag, 2 pale maroon bags, 5 vibrant violet bags.
               light beige bags contain 2 posh purple bags, 1 dull crimson bag.
               dark aqua bags contain 4 drab silver bags, 1 drab beige bag, 2 clear teal bags, 3 dull tan bags.
               dotted purple bags contain 3 drab cyan bags, 1 striped turquoise bag, 2 drab plum bags.
               wavy gray bags contain 3 dark chartreuse bags, 4 mirrored purple bags, 4 bright blue bags.
               faded olive bags contain 3 faded plum bags, 4 dull tan bags.
               shiny turquoise bags contain 1 shiny beige bag, 3 vibrant maroon bags.
               light tomato bags contain 3 wavy gray bags.
               striped maroon bags contain 2 dark white bags, 1 vibrant coral bag.
               dull coral bags contain 4 drab olive bags.
               muted silver bags contain 5 striped bronze bags, 5 wavy violet bags, 4 muted tan bags.
               dotted chartreuse bags contain 3 clear plum bags.
               faded lime bags contain 5 dull brown bags, 4 dim brown bags.
               posh coral bags contain 5 vibrant violet bags, 1 drab chartreuse bag, 2 faded yellow bags, 5 pale coral bags.
               dim green bags contain 1 dark teal bag.
               mirrored blue bags contain 1 mirrored gray bag, 4 dotted chartreuse bags, 3 striped silver bags, 2 shiny beige bags.
               mirrored aqua bags contain 4 dotted coral bags, 3 posh salmon bags, 5 drab bronze bags.
               light coral bags contain 5 shiny cyan bags, 2 faded turquoise bags, 5 plaid lime bags, 5 plaid bronze bags.
               vibrant maroon bags contain 3 dark chartreuse bags, 1 dark maroon bag, 2 shiny coral bags, 4 clear cyan bags.
               pale olive bags contain 4 dull lime bags, 5 wavy aqua bags.
               striped magenta bags contain 5 bright purple bags, 2 muted white bags.
               vibrant gold bags contain 1 plaid maroon bag, 3 pale tomato bags, 1 clear tomato bag.
               posh plum bags contain 5 mirrored salmon bags, 1 posh magenta bag, 2 posh bronze bags, 1 plaid gold bag.
               plaid maroon bags contain 3 striped crimson bags, 3 posh magenta bags, 2 mirrored olive bags, 2 dim gray bags.
               drab gold bags contain 2 dark chartreuse bags.
               plaid lavender bags contain 3 wavy bronze bags, 1 shiny blue bag, 5 mirrored purple bags, 4 muted aqua bags.
               faded green bags contain 3 vibrant yellow bags, 5 clear brown bags, 2 posh bronze bags.
               muted green bags contain 3 shiny red bags, 5 pale orange bags.
               posh chartreuse bags contain 5 pale indigo bags, 2 striped bronze bags, 3 mirrored blue bags, 1 light cyan bag.
               dark lime bags contain 4 bright gray bags, 2 drab purple bags, 5 vibrant indigo bags.
               plaid cyan bags contain 2 shiny cyan bags, 2 mirrored magenta bags, 2 dotted indigo bags.
               drab yellow bags contain 5 shiny gold bags.
               shiny crimson bags contain 2 dim black bags.
               posh olive bags contain 4 drab beige bags.
               muted crimson bags contain 4 bright bronze bags.
               shiny maroon bags contain 5 faded indigo bags, 2 drab plum bags, 2 striped yellow bags.
               muted coral bags contain 3 wavy olive bags, 1 posh olive bag.
               wavy yellow bags contain 5 drab beige bags, 2 wavy gray bags.
               dotted blue bags contain 4 clear magenta bags, 1 shiny bronze bag, 5 posh tan bags.
               mirrored silver bags contain 5 shiny lavender bags, 5 dark violet bags.
               dark white bags contain 1 clear maroon bag.
               faded tomato bags contain 5 shiny coral bags.
               dull orange bags contain 1 dim red bag, 4 posh plum bags, 5 posh orange bags, 3 bright cyan bags.
               plaid chartreuse bags contain 4 shiny bronze bags, 2 plaid salmon bags, 5 striped purple bags, 4 bright gold bags.
               striped white bags contain 2 dull indigo bags, 2 pale plum bags, 4 dim orange bags.
               wavy aqua bags contain 2 dull turquoise bags, 4 muted maroon bags.
               dim yellow bags contain 2 plaid tan bags.
               dark gray bags contain 2 wavy salmon bags, 2 plaid gold bags, 4 dim gold bags.
               muted lavender bags contain 4 drab coral bags, 1 vibrant yellow bag, 4 vibrant gray bags, 3 dull crimson bags.
               striped lime bags contain 5 dull yellow bags.
               striped bronze bags contain 4 wavy bronze bags, 1 striped silver bag.
               dark chartreuse bags contain no other bags.
               pale gold bags contain 2 mirrored olive bags, 2 drab violet bags.
               wavy teal bags contain 1 dark maroon bag, 5 muted chartreuse bags, 1 shiny black bag, 3 dotted aqua bags.
               bright fuchsia bags contain 1 muted cyan bag.
               """.textFileToListOfStrings()

    let day8 = """
               acc -15
               jmp +164
               nop +157
               acc -12
               acc -19
               acc +41
               jmp +177
               acc +36
               acc +37
               nop +471
               jmp +433
               acc +24
               acc +13
               acc -12
               jmp +556
               jmp +1
               acc -15
               acc +33
               jmp +299
               jmp +344
               acc -3
               jmp +124
               acc +10
               nop +562
               acc +45
               jmp +386
               acc -3
               jmp +206
               acc -19
               acc +12
               jmp +424
               acc -18
               acc +23
               acc +12
               acc +0
               jmp +311
               nop +327
               jmp +301
               acc +20
               nop +375
               jmp +25
               acc -13
               acc +49
               acc +23
               acc -3
               jmp +346
               acc +2
               acc +3
               jmp +123
               acc -7
               nop +183
               jmp +165
               acc +47
               acc +34
               jmp +1
               jmp +359
               acc +12
               acc +16
               acc -3
               acc +0
               jmp +556
               acc +14
               acc -3
               jmp +559
               jmp +192
               jmp +495
               nop +264
               acc +3
               acc +47
               jmp +187
               acc -18
               jmp +1
               acc -12
               jmp -58
               acc +49
               nop +288
               jmp +145
               acc +46
               jmp +294
               acc +38
               nop +400
               jmp +373
               acc +7
               acc +31
               jmp +492
               acc +40
               acc +5
               acc +11
               jmp +263
               acc +29
               acc +10
               acc +21
               acc +14
               jmp +450
               nop +458
               acc +38
               nop +432
               acc +42
               jmp +191
               jmp +279
               nop +71
               acc -17
               jmp -64
               acc +17
               jmp +1
               acc +29
               jmp +506
               jmp +354
               acc +42
               acc +32
               jmp -40
               jmp +184
               acc +41
               acc -7
               acc +10
               acc +38
               jmp +100
               jmp +104
               jmp +245
               jmp +335
               jmp +20
               acc +3
               jmp +490
               jmp -62
               acc +34
               acc +34
               acc -1
               jmp +6
               acc +5
               acc -9
               acc -19
               jmp +397
               jmp +253
               acc +9
               jmp +270
               acc +8
               acc -16
               acc +32
               acc +48
               jmp +258
               acc +4
               acc +37
               nop +319
               jmp +318
               jmp -4
               acc -5
               jmp +32
               nop -86
               jmp +306
               acc -13
               acc +50
               acc -16
               jmp -53
               acc +31
               jmp +52
               acc -11
               jmp +89
               acc +21
               jmp +126
               acc +44
               acc +49
               nop +177
               jmp +44
               acc +8
               jmp +166
               acc +20
               acc -8
               acc +38
               acc +10
               jmp +311
               jmp +21
               acc -10
               nop +84
               acc -7
               acc +13
               jmp +78
               jmp +1
               jmp +366
               acc -6
               acc -12
               jmp -142
               nop +223
               jmp +42
               acc -6
               nop +227
               nop +193
               acc +23
               jmp +83
               acc -10
               acc +12
               jmp +1
               acc -8
               acc +3
               nop +28
               jmp +301
               acc +23
               jmp -170
               nop -79
               acc +21
               acc +37
               jmp +138
               acc +37
               acc +24
               nop +413
               acc -9
               jmp -179
               acc -1
               acc -10
               nop +261
               acc -19
               jmp +168
               acc -16
               acc +19
               acc +17
               acc +21
               jmp -9
               jmp +46
               acc +4
               nop +398
               acc +28
               jmp +396
               acc +11
               jmp +384
               jmp +375
               acc +25
               acc +30
               acc -11
               jmp +371
               jmp +249
               acc -10
               acc -15
               jmp -7
               jmp +38
               acc +29
               acc +15
               acc +46
               jmp -77
               acc +43
               jmp -83
               jmp -42
               acc +30
               acc +44
               acc +33
               acc +14
               jmp +326
               acc -3
               nop +49
               acc +12
               jmp +63
               acc -13
               acc -19
               acc -17
               jmp +126
               jmp +293
               acc +16
               jmp -185
               acc -12
               jmp -92
               acc -13
               acc +19
               acc -1
               jmp -138
               acc +28
               nop -243
               nop +352
               acc +43
               jmp +249
               acc -5
               acc +36
               jmp -217
               nop +197
               nop -106
               acc +30
               jmp +194
               acc +7
               acc -16
               nop +128
               jmp -239
               jmp -258
               acc +11
               nop -74
               acc +42
               acc +40
               jmp +72
               jmp -207
               nop +337
               nop -240
               nop -169
               jmp -55
               nop +165
               acc +27
               acc +4
               jmp -169
               acc -2
               jmp +69
               acc +0
               jmp -250
               acc +11
               acc +45
               acc +31
               jmp +195
               acc -10
               acc -8
               nop -283
               acc -2
               jmp +63
               acc +17
               acc +12
               acc +0
               nop +243
               jmp +190
               acc +17
               acc -18
               jmp +78
               acc +7
               acc +33
               jmp +244
               nop +29
               acc +20
               nop +150
               acc +29
               jmp -43
               acc +45
               nop -132
               acc +16
               acc +14
               jmp -237
               jmp -199
               acc -4
               jmp +179
               acc +13
               acc +15
               acc +6
               acc +46
               jmp -222
               acc -8
               acc +15
               jmp -26
               acc +38
               jmp +1
               nop +266
               jmp +44
               acc -13
               nop +209
               acc +21
               jmp +201
               acc +8
               acc +18
               jmp +190
               acc +35
               jmp -238
               jmp +69
               acc -11
               nop -182
               jmp -221
               acc -16
               acc -5
               acc +7
               jmp +39
               acc +26
               acc +43
               acc +20
               jmp +92
               acc +22
               jmp +81
               acc +32
               acc -13
               jmp +30
               acc +1
               jmp +201
               acc +4
               jmp -165
               acc -17
               jmp -84
               acc -16
               acc +2
               acc +47
               jmp +54
               jmp -195
               acc +33
               acc -17
               jmp -18
               jmp +256
               acc +1
               jmp -244
               acc +28
               acc +35
               jmp +189
               nop +32
               acc +9
               jmp +24
               acc +21
               acc +14
               acc +17
               jmp -67
               acc +21
               jmp -297
               acc +36
               acc +14
               acc -13
               jmp +115
               acc -2
               acc -13
               jmp -182
               nop +119
               acc -4
               acc +44
               acc -14
               jmp +61
               acc +41
               jmp -13
               nop -116
               jmp -294
               jmp +7
               jmp +17
               acc -14
               acc +42
               acc -6
               acc +24
               jmp +151
               nop -374
               nop -375
               acc +4
               jmp -268
               nop -27
               acc +16
               acc +2
               jmp -206
               jmp -320
               nop -196
               jmp +168
               nop +36
               acc +34
               jmp -402
               acc +36
               acc +38
               acc -11
               nop +17
               jmp -182
               acc +15
               jmp -145
               acc +43
               jmp -79
               jmp -391
               jmp -155
               nop -94
               acc +0
               acc +9
               jmp -441
               acc +3
               acc +6
               acc +50
               nop -334
               jmp +163
               acc +18
               acc -11
               jmp +21
               acc +10
               acc +4
               nop +132
               jmp -348
               acc +18
               nop -1
               acc -4
               nop +148
               jmp +165
               jmp +146
               jmp -460
               jmp -14
               acc +26
               nop -388
               nop -353
               jmp +119
               acc +26
               acc -1
               acc +9
               jmp -285
               acc +37
               jmp -345
               jmp -178
               acc +7
               acc +13
               jmp -39
               acc +29
               nop -200
               acc +50
               acc +24
               jmp -160
               acc +18
               jmp +63
               acc -11
               acc +1
               acc -6
               acc +33
               jmp -90
               acc -3
               acc +11
               acc +45
               jmp -197
               jmp -169
               acc +7
               acc -4
               jmp -281
               acc +48
               nop +19
               nop -25
               nop +9
               jmp -274
               nop -126
               acc +22
               acc -4
               jmp -408
               acc +1
               acc +0
               jmp +98
               acc +25
               acc +12
               acc -19
               jmp -90
               acc +44
               acc +20
               acc +21
               jmp -192
               acc -12
               jmp -70
               nop +3
               acc +17
               jmp -349
               acc +20
               acc -7
               acc +6
               nop -43
               jmp +53
               acc +34
               acc +48
               acc -4
               acc +8
               jmp -126
               acc +23
               acc +25
               jmp -349
               acc -4
               jmp -272
               jmp -129
               nop -366
               jmp -292
               acc +29
               nop -269
               acc +50
               nop -254
               jmp -321
               jmp -23
               acc +11
               nop -425
               nop -150
               acc -9
               jmp -467
               acc +18
               acc +27
               jmp -338
               jmp +1
               acc +21
               acc +27
               acc -11
               jmp -160
               acc +27
               acc +15
               acc +0
               acc +41
               jmp -386
               acc -10
               acc +14
               jmp -217
               nop -484
               acc +47
               jmp -529
               acc -10
               acc +48
               acc +0
               jmp -430
               acc +45
               acc -8
               acc +3
               nop -103
               jmp -387
               acc -16
               acc +39
               jmp +1
               acc +17
               jmp -350
               jmp -328
               acc +30
               acc +28
               jmp -309
               nop -361
               acc +1
               nop -468
               jmp -212
               acc +29
               acc -4
               jmp -249
               acc +45
               acc +30
               acc +40
               acc -17
               jmp -579
               acc +25
               jmp -525
               nop -217
               acc +17
               acc +3
               jmp -142
               nop +18
               jmp -493
               jmp +1
               jmp -495
               jmp -360
               acc +7
               acc +30
               acc -3
               nop -449
               jmp -326
               acc -10
               acc -8
               jmp -371
               acc +22
               acc +48
               acc +6
               acc +18
               jmp -59
               acc +17
               acc +14
               jmp -250
               acc +19
               acc +25
               acc -14
               acc -17
               jmp -517
               acc +29
               acc -4
               acc +9
               acc +17
               jmp +1
               """
}
