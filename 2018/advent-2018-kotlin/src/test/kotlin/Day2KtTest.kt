import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test

class Day2KtTest {

    @Nested
    inner class ChecksumTest {
        @Test
        fun shouldTellMeHowManyInMyListHaveTwo() {
            val list = listOf(
                "AABC",
                "ABC",
                "ABAC",
                "ABACCA"
            )

            val flattenedList = Checksum.fromList(list)

            assertThat(flattenedList.numberOfDoubles).isEqualTo(3)
        }

        @Test
        fun shouldTellMeHowManyInMyListHaveThree() {
            val list = listOf(
                "AABC",
                "ABC",
                "ABAC",
                "ABACCA"
            )

            val flattenedList = Checksum.fromList(list)

            assertThat(flattenedList.numberOfTriples).isEqualTo(1)
        }

        @Test
        fun shouldGiveMeCorrectChecksum() {
            val checksum = Checksum(1, 1)

            assertThat(checksum.checksum).isEqualTo(1)
        }

        @Test
        fun shouldGiveMeCorrectChecksum2() {
            val checksum = Checksum(4, 3)

            assertThat(checksum.checksum).isEqualTo(12)
        }

        @Test
        fun shouldGiveMeCorrectChecksum3() {
            val checksum = Checksum(5, 12)

            assertThat(checksum.checksum).isEqualTo(60)
        }
    }


    @Nested
    inner class FindingTwo {
        @Test
        fun shouldReturnFalseWhenNoLettersMatch() {
            val answer = "ABCDE".hasExactlyTwoLetters()
            assertThat(answer).isEqualTo(false)
        }

        @Test
        fun shouldReturnTrueWhenTwoLettersMatch() {
            val answer = "ABCDEE".hasExactlyTwoLetters()
            assertThat(answer).isEqualTo(true)
        }
    }

    @Nested
    inner class FindingThree {

        @Test
        fun shouldReturnTrueForThreeLetters() {
            val answer = "ABCCCDEE".hasExactlyThreeLetters()
            assertThat(answer).isEqualTo(true)
        }

        @Test
        fun shouldReturnFalseForTwoLetters() {
            val answer = "ABCDEE".hasExactlyThreeLetters()
            assertThat(answer).isEqualTo(false)
        }
    }

    @Test
    fun shouldSortStrings() {
        val sorted = "abedc".sorted()
        assertThat(sorted).isEqualTo("abcde")
    }

    @Test
    fun shouldSolveDailyPuzzle() {
        val checksum = Checksum.fromList(
            listOf(
                "tjxmoewpqkyaiqvmndgflunszc",
                "tjxmobwpqkyaihvrndgfjubszm",
                "tjxmzewpqkyaihvrydgflrbszc",
                "tjxmoeypqkyvihvrndgflubsza",
                "tjcmoewpqkytihvrndgflgbszc",
                "tjvmoewpqkyanevrndgflubszc",
                "tjxmoewpqkdiihirndgflubszc",
                "tjxboewpqkyaihbrnogflubszc",
                "ojpmoewpqkyaihvjndgflubszc",
                "tjxyoewpqkyaiuvrndgflutszc",
                "tjxmoewpqkyalhvrndmflebszc",
                "tjxmoewpqzyaihhrndgflubszf",
                "tjxmrewpqkyaihirndgfjubszc",
                "pjxmoewpqkyaihvendgfbubszc",
                "txxmkewpqkyjihvrndgflubszc",
                "tjxmoewcqkyaihvrnmgflubczc",
                "tjxmoewkqkyaghvrndgfluvszc",
                "tjxmoewfqkhaihvrndgflubhzc",
                "jjqmoewpqkyaihvrndzflubszc",
                "tjxmoewmqksaihvcndgflubszc",
                "tjrmoewpqkyaihvrvdgflubzzc",
                "tjxxoewpqkyaiiwrndgflubszc",
                "cjxmoawxqkyaihvrndgflubszc",
                "tjxdoewpvkyaihvrndgflubsoc",
                "tjxmsewpqkyaihvrndgfluzozc",
                "tjxmoewpqkyafhvrnyeflubszc",
                "tjxmlewpqkyawhvondgflubszc",
                "tjxmonwpqkyaiqvrnxgflubszc",
                "tjxmoewcqkyaihvrnjgflumszc",
                "tjvmoewpqkyaihveadgflubszc",
                "tjxmogfpqkyaigvrndgflubszc",
                "tybmoewpqkyaihvrndgllubszc",
                "tjxmoewpdkyaihvrndgfluwbzc",
                "etxmbewpqkyaihvrndgflubszc",
                "tjxmoeapqcynihvrndgflubszc",
                "tbxmoewpqkyaihvrndgfdebszc",
                "haxmoewpqyyaihvrndgflubszc",
                "ojxmoewpqkyaihvrnegflubszr",
                "tjxmoewpqkyaihvrndoflubarc",
                "ljxmoewpqkykihvrndgflvbszc",
                "tjxmovwpqkyaihvrndgfluzsyc",
                "tvxmoewpqkyanhvrkdgflubszc",
                "tjxmoewpqkyaihkrndgfluwwzc",
                "zjxmoewpfkyaihvrndgfrubszc",
                "tjxyoegpqkyaihvrndlflubszc",
                "tjxmoewpqkyamhvrnsgflubmzc",
                "tjmmoewpqkyaihvrndgftuwszc",
                "tjxmoewpqbraihvrncgflubszc",
                "tjxmeeepqkyainvrndgflubszc",
                "tjemoegpqkyaihvredgflubszc",
                "tjxmoewpqkyaihvdndgfzubqzc",
                "tjxmoegrqkyaihfrndgflubszc",
                "tjxmoewpqxyaihvrndgfluyvzc",
                "qjxmoewpqkyaiwvrnfgflubszc",
                "tjxwoewpqkyashkrndgflubszc",
                "tjzmoewiqkyaihurndgflubszc",
                "tjumuewpqkyaihvrndgflubssc",
                "tyxooewpukyaihvrndgflubszc",
                "tjxvoewpqkyaiivindgflubszc",
                "ijxmoqwpqkyaihvradgflubszc",
                "tjxmlewpqkyaihvrhdgflubwzc",
                "tjxmkewpqkyajhqrndgflubszc",
                "tjxmoewpqkqaiherndgflurszc",
                "tjamoewpqkyaizvondgflubszc",
                "tjxgogwpqkyalhvrndgflubszc",
                "tjxmoewpqkyachvrndgflubuzq",
                "tjxmowqpqkyaihvrnegflubszc",
                "mjxmoewpwkyaihvrndgfkubszc",
                "tpbmoewpqkyaihvrzdgflubszc",
                "tjbmoewpqkyaiuvrndgflsbszc",
                "tjxmoewpqklaghvrndgflubazc",
                "tjxmoewpqkyrihvrndgwlpbszc",
                "tjcmoewpqksaiyvrndgflubszc",
                "tjxmoeapqkymihvindgflubszc",
                "tjxmdewpqkyafhvrndgflqbszc",
                "tjxmoewpqxyaihvrndsflubszi",
                "tjxmoeppqkyaihvrcdgflubszd",
                "tjxmomwpqkyainvrmdgflubszc",
                "tjxmovwpqkyaihvrndgfdubdzc",
                "tjxmoewwqkiaihvrjdgflubszc",
                "tmxmoewpqkyaifvrndgflubszs",
                "tbxmoewpqkyaihvrbdgflunszc",
                "tjxmoewrqkyaihvxndgflubszp",
                "ujxmoewpqkyaihvxndgflubpzc",
                "tdxmotwpqkyaihvdndgflubszc",
                "tjxmvewpqkyaihfrndgtlubszc",
                "tjfmoewpqkyaihvrnyqflubszc",
                "tjxfolwzqkyaihvrndgflubszc",
                "ojrmoiwpqkyaihvrndgflubszc",
                "tjsmoqwpqkyqihvrndgflubszc",
                "tjxmohwpqkyaihvrudgflubslc",
                "tjxtoiwpqkyaihvrnogflubszc",
                "taxmoewpqkyaiyvrndgfwubszc",
                "tjxwnezpqkyaihvrndgflubszc",
                "tjxmyevpqkyaivvrndgflubszc",
                "tjxdoeopqkyaihvgndgflubszc",
                "tjxaoewpqkmaihvrndgflufszc",
                "tjxmoewpqkyaxhvrndgflubncc",
                "tjxmoewpqkyaihurndgflubbjc",
                "tjxmjewpqgyaihvrnngflubszc",
                "tjxmogwpqkyaihvrndgflubbcc",
                "tjxmoewplkyaihvrnpgflibszc",
                "tjwmoewpqkyaohvrndgfbubszc",
                "tjwmoewpqkyaihvrndgfsubszm",
                "tjxmogwpqkyaihvrndiflubqzc",
                "tjxmoewpqkyaihvrndgflopshc",
                "rjxmlewpvkyaihvrndgflubszc",
                "tjxmogwpakyaihvrndgflzbszc",
                "tjxmoeppqkyaihvrndgflmxszc",
                "tjxmoewpqkyhihgrndgfzubszc",
                "tjxqoewpqkyaihtrndgwlubszc",
                "tjxnoespqkyaihvrndgflubsuc",
                "tjmmoewpqkraihvrndgflfbszc",
                "tjxmoewnqkwaihvrndgflubstc",
                "tjxmoewpqqyaihvrndgfljbszi",
                "tjxmoewpqkyaihkrkdgalubszc",
                "tjxmoewpqkyaihvradgjlurszc",
                "tvxmoewpqkybihvrndbflubszc",
                "tjxvoewpqkyaihvradgfoubszc",
                "tjxmoewpqfyaihvlodgflubszc",
                "tjxmoewmnkyaiivrndgflubszc",
                "kjxmoewpqkyaihprndgflcbszc",
                "hjxmoewpqkcaihvrndgvlubszc",
                "tjxmoewcqkyaihvrncgfllbszc",
                "tuxmoewpckyaihvrndoflubszc",
                "tjxmdewpokyaihvrndgflubszn",
                "mjxmaewpqkyaqhvrndgflubszc",
                "tjxmoewpmzyaihvrndgfiubszc",
                "tjxmoewnqkyvihvrndgflubszk",
                "tjxmoewpmnyaihvrndgftubszc",
                "zjxmoewpqkysihvrndgfmubszc",
                "tjxmoewpqkyaihzrntgflubbzc",
                "tjxmoewpqkgaihwrndsflubszc",
                "tjxjoewpqkyaihvrndgflgbizc",
                "oqxmoewpqkyaihvrndgfldbszc",
                "wjamoewpqkyaihvfndgflubszc",
                "tjxmoewtmkyvihvrndgflubszc",
                "tjlmojwpqkyaihvrndgfludszc",
                "tjxmowwpqkyaihvrndefludszc",
                "tjxmoewpqkbaihvrndgfluaszt",
                "tjxmoewpqkzaahvrodgflubszc",
                "tjxmoewpqkgaihvrndgflubtpc",
                "tjxmoenpqkyaihcrndgfqubszc",
                "tbxmoewpqbyaihvrndgalubszc",
                "tjvmoewqqkyaihvrndvflubszc",
                "tjxmoewpqkeaihvundgfaubszc",
                "txxmoewpqkyaihvrwdgflpbszc",
                "tzxmoewpqkijihvrndgflubszc",
                "tjxmoewoqkytiuvrndgflubszc",
                "tjxmrejplkyaihvrndgflubszc",
                "tjxmoewpqkynihvrpxgflubszc",
                "tjxmoewpqkvanhvrndgvlubszc",
                "tjxmoewpdkyiihvrndgflubszs",
                "tpxmyewpqkyaihvrndgfeubszc",
                "tpxmoewpqyyaihvrndhflubszc",
                "tjsmoewpqkyaihvrndhflubnzc",
                "tjxmoewpukyaihvrnmgflubwzc",
                "txxmoewpqlyaihwrndgflubszc",
                "tjxmoewprkyaiovrndgflubxzc",
                "tjxmouwpqkyaihzrodgflubszc",
                "tjxmojwpqkywimvrndgflubszc",
                "tjxsoewpqkyaihvrzdgqlubszc",
                "tfxmoewpakyaihvrndgllubszc",
                "tjhmoewpqiyaihvrndgflubsac",
                "tjxmoewpqkoaihvrndoflubsxc",
                "tjxmoewpqkyzpjvrndgflubszc",
                "tjxmoewpqkyaiharndgzlnbszc",
                "tjimoevpqkyaihvrndgflubbzc",
                "tjxsoewpqkyahhvrndgfzubszc",
                "txxmoewpqkyaimvrrdgflubszc",
                "tjxmoewpwkyaihvrndpylubszc",
                "tjxmoewpskyaghvrndgfbubszc",
                "tjxmuewpqmyaihvrndgfyubszc",
                "tjxmoewpqkyaihvdndgglubsxc",
                "xjxmoewpqkyjiovrndgflubszc",
                "gjxmoewpqkyaihvrndodlubszc",
                "tjbmoewpqkyaihvridgflvbszc",
                "tjxmozwpqkyapbvrndgflubszc",
                "tjxeoewpqkyqihvrndgflubhzc",
                "tjxdoewpqzyaihvrndgflubsmc",
                "tjxmwewpqkyathvcndgflubszc",
                "tjxmoewpszyaihvrndgflusszc",
                "tuxmoewpqkyaihvrndgfluasxc",
                "tjemoewpnvyaihvrndgflubszc",
                "tjxmoewpjkyaihvrndgjlufszc",
                "tjomoewppkyaihvzndgflubszc",
                "tjxmvewpqkyaimvrntgflubszc",
                "rjxmoewpqkyaihvpndgflubszq",
                "hjxzoewpqkyaihvridgflubszc",
                "texmoejpqkyaihvrndgflubszx",
                "tjxcoewpqkyaihbrxdgflubszc",
                "tjxmoewpnkyaihvrndgfltbsze",
                "tjxmoewpdkyaihvrndwfluwbzc",
                "tjxmoewpqryjihkrndgflubszc",
                "tjlmoewpqkhaihvrndgflubsnc",
                "tjxmovapqkjaihvrndgflubszc",
                "tjxvoewpqkyaihqrndgfluyszc",
                "tjxwoewnqkyaihvrndgfgubszc",
                "tjdmoewpqklaihvcndgflubszc",
                "tjxmoewpvkynihvrndgflubskc",
                "tjxmtewpqkyaihvhndgfluaszc",
                "tjxmoewpqkyanhvrnpgfluvszc",
                "tjxmoewpqkyaifvbndgflubspc",
                "tjxmoexpqknaihvrndgxlubszc",
                "qjxmoewqqkyaihvrndgflubpzc",
                "tjxmoewppkyaihvaxdgflubszc",
                "myxmoewpqkyaihvrudgflubszc",
                "tjxmwewpmkyaihvrndgflubssc",
                "tjxmoewpqkyaihvrndgfxqbszq",
                "tjxmoewhqkyaahvrndgflubbzc",
                "tbxmoewmqkyaihvrndgflubszu",
                "toxmolwpqkyaihvrndnflubszc",
                "tjxmoewhqkyaihvrnrgflubvzc",
                "yjxmoewcqkyaihvrndgflubfzc",
                "tjxmoewpqkyamhvrgdgflmbszc",
                "tjxmtewpqkyaizvrndgfluoszc",
                "tjxmoewpqzyaihvrntsflubszc",
                "fjxmoewpqkyaihyrmdgflubszc",
                "tjxwoewpqcyaihbrndgflubszc",
                "tjxmoebpqkzaihvrndcflubszc",
                "tjxmoewpqkyaihvrndnlmubszc",
                "tjxmoewpqkyaihvrndgeyubskc",
                "tfxmoewpqryaihvrndgfluiszc",
                "tjxmoewpqkjaihvynngflubszc",
                "tjxmoewpqkqaihvonjgflubszc",
                "tjfmokwpqkyeihvrndgflubszc",
                "djxmoewpkkyaihvrnmgflubszc",
                "tjxmiewpqkyaihvrndgflubhlc",
                "tjxmmejpqkyaihvrnhgflubszc",
                "djxmoewmqkyaihvrnggflubszc",
                "tjxmoewpqkyaihvrkggflubsze",
                "gjxmoewpqkyaihjrndgflvbszc",
                "tjxmoewpqkyaidvrndgkzubszc",
                "tjxmoewpqkyaedvrnpgflubszc",
                "sjxmoewpqkyaihvrnngfluhszc",
                "tjxmoewpqkuaihvrndghlubxzc",
                "tjxmoewgqkyuihvrndgftubszc",
                "tjxmoewpqsyaifvrkdgflubszc",
                "tjxrrewpqkyaihvrnpgflubszc",
                "tjxmoezpqkyaihvrwdgflabszc",
                "tjfmoewpqknaihvrndgflubkzc",
                "tjxmoewnqkxaihvrndgflubtzc",
                "tjxmoewpkkyaihvrndgfrnbszc",
                "tjxmorwpnkqaihvrndgflubszc",
                "tsxmoewwqkyathvrndgflubszc",
                "tjxmoeupqkyaihvrndyflubszp",
                "bjxmoewdqkyaihvrndgflurszc",
                "tjxmoewpvkyaihvrndoflubszq",
                "sjxmoewpqkyaihvrndgflubyec",
                "tjxmoewpqkyaizcrndgfnubszc"
            )
        ).checksum

        assertThat(checksum).isEqualTo(7872)
    }
}